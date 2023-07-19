import 'package:flutter/material.dart';
import 'package:mobidoc/assets/colors/color_scheme.dart';
import 'package:mobidoc/assets/text/text_extention.dart';
import 'package:mobidoc/features/main/screen/main_screen.dart';
import 'package:mobidoc/features/main/widgets/setting_button.dart';

/// Header widget for [MainScreen].
class MainHeader extends StatelessWidget {
  /// Create an instance [MainHeader].
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 210,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-0.95, -0.3),
              end: const Alignment(0.95, 0.3),
              colors: [
                colorScheme.gradientStart,
                colorScheme.gradientEnd,
              ],
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 16,
          child: Text(
            'Кирилл Пояснялов',
            style: AppTextTheme.of(context)
                .bold24
                .copyWith(color: colorScheme.background),
          ),
        ),
        Positioned(
          right: 15,
          bottom: 15,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 35,
                      color: colorScheme.background.withAlpha(40),
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: colorScheme.background,
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: ClipOval(
                    child: Image.network(
                      'https://www.photopills.com/sites/default/files/photopillers/benito-gaztelugatxe.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          bottom: 28,
          child: SettingButton(onPressed: () {}),
        ),
      ],
    );
  }
}
