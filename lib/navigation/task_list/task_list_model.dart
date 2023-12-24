import 'package:elementary/elementary.dart';
import 'package:empay_test/state/task_bloc.dart';


class TaskListModel extends ElementaryModel {
  final TaskBloc _bloc;

  TaskListModel(this._bloc) : super(errorHandler: DefaultDebugErrorHandler());
}
