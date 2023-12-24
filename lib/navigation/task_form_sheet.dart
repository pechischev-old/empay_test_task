import 'package:flutter/material.dart';
import 'package:empay_test/widgets/bottom_sheet.dart';
import 'package:gap/gap.dart';

class TaskFormSheet extends StatelessWidget {
  const TaskFormSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return _Content();
  }

  static void show(BuildContext context) {
    BottomSheetModal(
      appbar: BottomSheetNavigationBar(
        leading: 'Cancel',
        onLeadingTap: () => Navigator.pop(context),
        trailing: 'Save',
      ),
      shrink: true,
      child: const TaskFormSheet(),
    ).show(context);
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const Gap(32),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
        ],
      ),
    );
  }
}
