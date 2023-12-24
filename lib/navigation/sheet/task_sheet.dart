import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:elementary/elementary.dart';
import 'package:empay_test/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'task_sheet_wm.dart';

class TaskSheet extends ElementaryWidget<TaskSheetWidgetModel> {
  final ScrollController controller;

  const TaskSheet({
    Key? key,
    required this.controller,
    required WidgetModelFactory wmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(TaskSheetWidgetModel wm) {
    return ValueListenableBuilder(
      valueListenable: wm.editable,
      builder: (_, editable, __) {
        return ListView(
          controller: controller,
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: wm.titleEditingController,
                    enabled: editable,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: editable ? wm.done : wm.turnOnEdit,
                  child: Text(
                    editable ? 'Done' : 'Edit',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Gap(8),
                TextButton(
                  onPressed: wm.cancelEdit,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Gap(32),
            TextFormField(
              controller: wm.descriptionEditingController,
              enabled: editable,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const Gap(40),
            if (!editable)
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: wm.updateTaskStatus,
                      child: Text(wm.completed ? 'Incomplete' : 'Complete'),
                    ),
                  ),
                  const Gap(8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: wm.deleteTask,
                      child: const Text('Delete'),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }

  static void show(BuildContext context, {Task? task}) {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 0.8,
      context: context,
      builder: (context, controller, _) => TaskSheet(
        controller: controller,
        wmFactory: (context) => taskViewSheetWidgetModelFactory(context, task),
      ),
    );
  }
}
