import 'package:elementary/elementary.dart';
import 'package:empay_test/domain/domain.dart';
import 'package:empay_test/state/task_bloc.dart';


class TaskListModel extends ElementaryModel {
  final TaskBloc _bloc;

  TaskListModel(this._bloc) : super(errorHandler: DefaultDebugErrorHandler());

  void updateTask(Task task) => _bloc.add(TaskEvent.updateTask(task));

  void deleteTask(Task task) => _bloc.add(TaskEvent.deleteTask(task));
}
