import 'package:flutter/material.dart';
import 'package:mobidoc/assets/colors/color_scheme.dart';
import 'package:mobidoc/assets/text/text_extention.dart';

/// Filled card widget.
class FilledCard extends StatelessWidget {
  /// Create an instance [FilledCard].
  const FilledCard({
    required this.title,
    required this.subtitle,
    this.onPressed,
    super.key,
  });

  /// Title text.
  final String title;
  /// Subtitle text.
  final String subtitle;
  /// The function that will be called when the button is pressed.
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return SizedBox(
      child: Material(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: const EdgeInsets.only(
            left: 30,
            right: 15,
            top: 15,
            bottom: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.bold18,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      subtitle,
                      style: textTheme.medium14
                          .copyWith(color: colorScheme.onSurface),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Ink(
                decoration: ShapeDecoration(
                  color: colorScheme.secondary,
                  shape: const CircleBorder(),
                ),
                child: IconButton(
                  color: colorScheme.onSecondary,
                  onPressed: onPressed,
                  iconSize: 24,
                  icon: const Icon(
                    Icons.list_rounded,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
