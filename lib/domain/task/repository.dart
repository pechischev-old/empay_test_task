import 'model.dart';
import 'package:uuid/uuid.dart';

class TaskRepository {
  final uuidGenerator = const Uuid();
  final List<Task> source = [];

  void init() {
    // set mock data
    source.addAll([
      Task(id: uuidGenerator.v4(), title: 'Think a task', completed: true),
      Task(id: uuidGenerator.v4(), title: 'Write a task'),
      Task(id: uuidGenerator.v4(), title: 'Complete a task'),
    ]);
  }

  Future<List<Task>> getTasks() async {
    return source.toList();
  }

  Future<void> createTask(Task task) async {
    // emulate task getting from "backend" - set unique id
    final savedTask = task.copyWith(id: uuidGenerator.v4());
    source.add(savedTask);
  }

  Future<void> updateTask(Task task) async {
    final index = source.indexWhere((item) => item.id == task.id);
    if (index > -1) {
      source[index] = task;
    }
  }

  Future<void> deleteTask(Task task) async {
    source.removeWhere((item) => item.id == task.id);
  }
}
