import 'package:flutter/material.dart';
import 'package:mobidoc/assets/colors/color_scheme.dart';
import 'package:mobidoc/assets/text/text_extention.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard(
      {super.key, required this.name, required this.type, required this.info});

  final String name;
  final String type;
  final String info;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColorScheme.of(context).onSecondary,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://www.photopills.com/sites/default/files/photopillers/benito-gaztelugatxe.jpg',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: textTheme.bold22,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              type,
              style: textTheme.medium14,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              info,
              style: textTheme.regular14,
            ),
          ],
        ),
      ),
    );
  }
}
