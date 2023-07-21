import 'package:flutter/material.dart';
import 'package:mobidoc/assets/colors/color_scheme.dart';
import 'package:mobidoc/assets/text/text_extention.dart';

/// Filled card widget.
class FilledCard extends StatelessWidget {
  /// Create an instance [FilledCard].
  const FilledCard({
    required this.title,
    required this.subtitle,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String subtitle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return SizedBox(
      height: 80,
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
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  ),
                ],
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
