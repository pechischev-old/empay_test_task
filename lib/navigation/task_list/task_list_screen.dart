import 'package:elementary/elementary.dart';
import 'package:empay_test/domain/domain.dart';
import 'package:empay_test/state/task_bloc.dart';
import 'package:empay_test/widgets/segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task_list_wm.dart';

class TaskListScreen extends ElementaryWidget<TaskListWidgetModel> {
  const TaskListScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultTaskListWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(TaskListWidgetModel wm) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ValueListenableBuilder(
                valueListenable: wm.selectedSegment,
                builder: (context, value, _) {
                  return SegmentedControl<SegmentType>(
                    selectedSegment: value,
                    segments: wm.segments,
                    onTap: wm.selectSegment,
                  );
                },
              ),
            ),
            Expanded(
              // always get new state directly from bloc
              child: BlocBuilder<TaskBloc, List<Task>>(
                builder: (context, tasks) {
                  return ValueListenableBuilder(
                    valueListenable: wm.selectedSegment,
                    builder: (context, value, _) {
                      final filteredTasks = wm.getTasksBySegment(tasks);
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          final task = filteredTasks[index];
                          return ListTile(
                            key: ValueKey(task.id),
                            title: Text(task.title),
                            leading: Checkbox(
                              value: task.completed,
                              onChanged: (value) =>
                                  wm.updateTaskStatus(task, value ?? task.completed),
                            ),
                            trailing: IconButton(
                              onPressed: () => wm.handleDeleteTask(task),
                              icon: const Icon(Icons.delete),
                            ),
                            onTap: () => wm.handleTapOnTask(task),
                          );
                        },
                        itemCount: filteredTasks.length,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: wm.handleCreateTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
