//ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// App color palette.
///
/// http://www.color-blindness.com/color-name-hue/.

 enum AppColors {
  cornflowerBlue(Color(0xFF5E9EED)),
  aliceBlue(Color(0xFFEAF4FE)),
  nero(Color(0xFF222222)),
  razzmatazz(Color(0xFFD40055)),
  titanWhite(Color(0xFFDAD7E0)),
  lavenderBlue(Color(0xFFCAE6FC)),
  manatee(Color(0xFF8C92A4)),
  lightCyan(Color(0xFFC9E9FF)),
  prussianBlue(Color(0xFF000F3D)),
  jaguar(Color(0xFF181719)),
  oxfordBlue(Color(0xFF263238)),
  horizon(Color(0xFF428989)),
  purple(Color(0xFF7A3E93)),
  freeSpeechRed(Color(0xFFB00000)),
  white(Color(0xFFFFFFFF)),
  pastelWhite(Color(0xFFFAFAFA)),
  solitude(Color(0xFFE5E8EB)),
  darkGrey(Color(0xFFA7A7A7)),
  raisinBlack(Color(0xFF212121)),
  dodgeBlue(Color(0xFF007AFE));

  final Color value;

  const AppColors(this.value);
}
