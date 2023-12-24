import 'package:elementary/elementary.dart';
import 'package:empay_test/domain/task/model.dart';
import 'package:empay_test/state/task_bloc.dart';

class TaskSheetModel extends ElementaryModel {
  final TaskBloc _bloc;

  TaskSheetModel(this._bloc) : super(errorHandler: DefaultDebugErrorHandler());

  void createTask({
    required String title,
    String? description,
  }) =>
      _bloc.add(TaskEvent.addTask(
        title: title,
        description: description,
      ));

  void updateTask(Task task) => _bloc.add(TaskEvent.updateTask(task));

  void deleteTask(Task task) => _bloc.add(TaskEvent.deleteTask(task));
}
