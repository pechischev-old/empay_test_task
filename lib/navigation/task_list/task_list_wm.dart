import 'package:elementary/elementary.dart';
import 'package:empay_test/domain/task/model.dart';
import 'package:empay_test/navigation/task_form_sheet.dart';
import 'package:empay_test/navigation/task_view_sheet.dart';
import 'package:empay_test/state/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_list_model.dart';
import 'task_list_screen.dart';

TaskListWidgetModel defaultTaskListWidgetModelFactory(BuildContext context) {
  final taskBloc = context.read<TaskBloc>();
  return TaskListWidgetModel(TaskListModel(taskBloc));
}

class TaskListWidgetModel extends WidgetModel<TaskListScreen, TaskListModel> {
  TaskListWidgetModel(TaskListModel model) : super(model);

  final _selectedSegment = ValueNotifier(SegmentType.active);

  void selectSegment(SegmentType value) => _selectedSegment.value = value;

  void handleTapOnTask(Task task) => TaskViewSheet.show(context, task);

  void updateTaskStatus(Task task, bool statusValue) =>
      model.updateTask(task.copyWith(completed: statusValue));

  void handleDeleteTask(Task task) => model.deleteTask(task);

  void handleCreateTask() => TaskFormSheet.show(context);

  List<SegmentType> get segments => [SegmentType.active, SegmentType.completed];

  ValueNotifier<SegmentType> get selectedSegment => _selectedSegment;

  List<Task> getTasksBySegment(List<Task> tasks) => tasks
      .where(
        (task) => _selectedSegment.value == SegmentType.active
            ? !task.completed
            : task.completed,
      )
      .toList();
}

enum SegmentType {
  active('Active'),
  completed('Completed');

  const SegmentType(this.name);

  final String name;

  @override
  String toString() => name;
}
