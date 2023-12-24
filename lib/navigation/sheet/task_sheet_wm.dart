import 'package:elementary/elementary.dart';
import 'package:empay_test/domain/domain.dart';
import 'package:empay_test/state/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task_sheet_model.dart';
import 'task_sheet.dart';

TaskSheetWidgetModel taskViewSheetWidgetModelFactory(
  BuildContext context,
  Task? task,
) {
  final taskBloc = context.read<TaskBloc>();
  return TaskSheetWidgetModel(TaskSheetModel(taskBloc), task);
}

class TaskSheetWidgetModel extends WidgetModel<TaskSheet, TaskSheetModel> {
  TaskSheetWidgetModel(TaskSheetModel model, this._task) : super(model);

  final Task? _task;
  final _titleEditingController = TextEditingController();
  final _descriptionEditingController = TextEditingController();
  final _editable = ValueNotifier(true);

  TextEditingController get titleEditingController => _titleEditingController;

  TextEditingController get descriptionEditingController =>
      _descriptionEditingController;

  bool get completed => _task?.completed ?? false;

  ValueNotifier<bool> get editable => _editable;

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    if (_task == null) {
      return;
    }

    _titleEditingController.text = _task.title;
    _descriptionEditingController.text = _task.description;
    _editable.value = false;
  }

  void close() => Navigator.pop(context);

  void cancelEdit() {
    if (_editable.value && _task != null) {
      _editable.value = false;
      _titleEditingController.text = _task.title;
      _descriptionEditingController.text = _task.description;
      return;
    }
    close();
  }

  void turnOnEdit() => _editable.value = true;

  void done() {
    final title = _titleEditingController.text;
    final description = _descriptionEditingController.text;

    if (_task == null) {
      model.createTask(title: title, description: description);
    } else {
      model.updateTask(_task.copyWith(title: title, description: description));
    }

    close();
  }

  void deleteTask() {
    if (_task == null) {
      return;
    }
    model.deleteTask(_task);
    close();
  }

  void updateTaskStatus() {
    if (_task == null) {
      return;
    }

    model.updateTask(_task.copyWith(completed: !_task.completed));
    close();
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    _descriptionEditingController.dispose();
    super.dispose();
  }
}
