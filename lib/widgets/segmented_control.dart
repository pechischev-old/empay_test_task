import 'package:flutter/material.dart';

import 'package:material_segmented_control/material_segmented_control.dart';

class SegmentedControl<T> extends StatelessWidget {
  final List<T> segments;
  final T selectedSegment;
  final Function(T) onTap;

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
      children: Map.fromIterable(segments, value: (item) => Text(item.toString())),
      selectionIndex: selectedSegment,
      borderColor: Colors.grey,
      selectedColor: theme.primaryColor,
      unselectedColor: theme.colorScheme.background,
      onSegmentTapped: (name) => onTap(name),
    );
  }
}