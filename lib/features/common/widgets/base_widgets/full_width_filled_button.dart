import 'package:flutter/material.dart';

/// A Material Design "Filled Button" with full-width size.
class FullWidthFilledButton extends StatelessWidget {
  /// Create an instance [FullWidthFilledButton].
  const FullWidthFilledButton({
    required this.child,
    this.onPressed,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// Called when the button is pressed.
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
