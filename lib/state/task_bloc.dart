import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:empay_test/domain/domain.dart';

part 'task_bloc.freezed.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const TaskEvent._();

  const factory TaskEvent.addTask() = _AddTaskEvent;
  const factory TaskEvent.updateTask() = _UpdateTaskEvent;
  const factory TaskEvent.deleteTask() = _DeleteTaskEvent;
}

class TaskBloc extends Bloc<TaskEvent, List<Task>> {
  final TaskRepository repository;
  TaskBloc({
    required this.repository,
  }) : super([]);

}