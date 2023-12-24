import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:empay_test/domain/domain.dart';

part 'task_bloc.freezed.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const TaskEvent._();

  const factory TaskEvent.load() = _LoadEvent;

  const factory TaskEvent.addTask({
    required String title,
    String? description,
  }) = _AddTaskEvent;

  const factory TaskEvent.updateTask(Task task) = _UpdateTaskEvent;

  const factory TaskEvent.deleteTask(Task task) = _DeleteTaskEvent;
}

class TaskBloc extends Bloc<TaskEvent, List<Task>> {
  final TaskRepository repository;

  TaskBloc({
    required this.repository,
  }) : super([]) {
    on<_AddTaskEvent>(_add);
    on<_UpdateTaskEvent>(_update);
    on<_DeleteTaskEvent>(_delete);
    on<_LoadEvent>(_load);

    add(const TaskEvent.load());
  }

  Future<void> _load(_LoadEvent event, Emitter<List<Task>> emit) async {
    final tasks = await repository.getTasks();
    emit(tasks);
  }

  Future<void> _add(_AddTaskEvent event, Emitter<List<Task>> emit) async {
    final newTask = Task(title: event.title, description: event.description);
    await repository.createTask(newTask);

    add(const TaskEvent.load());
  }

  Future<void> _update(_UpdateTaskEvent event, Emitter<List<Task>> emitter) async {
    await repository.updateTask(event.task);
    add(const TaskEvent.load());
  }

  Future<void> _delete(_DeleteTaskEvent event, Emitter<List<Task>> emit) async {
    await repository.deleteTask(event.task);
    add(const TaskEvent.load());
  }
}
