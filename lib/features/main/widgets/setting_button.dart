import 'package:flutter/material.dart';
import 'package:mobidoc/assets/colors/color_scheme.dart';
import 'package:mobidoc/assets/text/text_extention.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.onBackground,
        minimumSize: const Size(135, 32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Настройки',
            style: textTheme.medium14,
          ),
          const SizedBox(
            width: 9,
          ),
          const Icon(Icons.settings_rounded),
        ],
      ),
    );
  }
}
