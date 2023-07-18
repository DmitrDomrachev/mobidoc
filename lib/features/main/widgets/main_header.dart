import 'package:flutter/material.dart';
import 'package:mobidoc/assets/text/text_extention.dart';
import 'package:mobidoc/features/main/widgets/setting_button.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 210,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.95, -0.3),
              end: Alignment(0.95, 0.3),
              colors: [Color(0xFF007AFE), Color(0xFF6D94FB)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 16,
          child: Text(
            'Кирилл Пояснялов',
            style:
                AppTextTheme.of(context).bold24.copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          right: 15,
          bottom: 15,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: const ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 35,
                      color: Color(0x4dffffff),
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
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
