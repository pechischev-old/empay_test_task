import 'package:flutter/material.dart';

import 'package:material_segmented_control/material_segmented_control.dart';

class SegmentedControl extends StatelessWidget {
  final List<String> segments;
  final String selectedSegment;
  final Function(String) onTap;

  const SegmentedControl({
    super.key,
    required this.segments,
    required this.selectedSegment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialSegmentedControl(
      children: Map.fromIterable(segments,  value: (item) => Text(item)),
      selectionIndex: selectedSegment,
      borderColor: Colors.grey,
      selectedColor: theme.primaryColor,
      unselectedColor: theme.colorScheme.background,
      onSegmentTapped: (name) => onTap(name),
    );
  }
}