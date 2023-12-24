import 'package:flutter/material.dart';

class BottomSheetModal extends StatelessWidget {
  final Widget appbar;
  final Widget child;
  final bool? shrink;

  const BottomSheetModal({
    super.key,
    this.shrink,
    required this.child,
    required this.appbar,
  });

  Future<T?> show<T>(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) => BottomSheetModal(
        appbar: appbar,
        shrink: shrink,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: appbar,
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                physics: const ClampingScrollPhysics(),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetNavigationBar extends StatelessWidget {
  final String? title;
  final String? leading;
  final String? trailing;
  final GestureTapCallback? onLeadingTap;
  final GestureTapCallback? onTrailingTap;

  const BottomSheetNavigationBar({
    super.key,
    this.title,
    this.leading,
    this.trailing,
    this.onTrailingTap,
    this.onLeadingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (leading != null)
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                onLeadingTap?.call();
              },
              child: Text(
                leading!,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        if (title != null)
          Text(
            title!,
            style: const TextStyle(fontSize: 18),
          ),
        if (trailing != null)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                onTrailingTap?.call();
                Navigator.maybePop(context);
              },
              child: Text(
                trailing!,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
      ],
    );
  }
}
