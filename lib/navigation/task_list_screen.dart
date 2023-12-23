import 'package:flutter/material.dart';
import 'package:empay_test/widgets/segmented_control.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SegmentedControl(
                selectedSegment: 'Active',
                segments: const ['Active', 'Completed'],
                onTap: (String value) {  }, // TODO: change segment
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Task $index'),
                    leading: Checkbox(
                      value: false,
                      onChanged: (_) {}, // TODO: mark as completed/uncompleted
                    ),
                    trailing: IconButton(
                      onPressed: () {}, // TODO: remove task
                      icon: const Icon(Icons.delete),
                    ),
                    onTap: () {}, // TODO: open edit task bottom sheet
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO: open add task bottom sheet
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
