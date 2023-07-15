import 'package:flutter/material.dart';

/// A Material Design "Elevated Button" with full-width size and zero initial elevation.
class FullWidthElevatedButton extends StatelessWidget {
  /// Create an instanse [FullWidthElevatedButton].
  const FullWidthElevatedButton({
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
