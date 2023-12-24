import 'package:flutter/material.dart';
import 'package:empay_test/widgets/bottom_sheet.dart';
import 'package:gap/gap.dart';

class TaskViewSheet extends StatelessWidget {
  const TaskViewSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return _Content();
  }

  static void show(BuildContext context) {
    const BottomSheetModal(
      appbar: BottomSheetNavigationBar(
        leading: 'Edit',
        title: 'View detail',
        trailing: 'Close',
      ),
      shrink: true,
      child: TaskViewSheet(),
    ).show(context);
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: TextStyle(fontSize: 24),
        ),
        const Gap(16),
        Text(
          'Description',
          style: TextStyle(fontSize: 20),
        ),
        const Gap(40),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Complete'),
          ),
        ),
        const Gap(8),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Delete'),
          ),
        ),
      ],
    );
  }
}
