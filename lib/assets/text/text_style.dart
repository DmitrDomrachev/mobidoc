//ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// App text style.
enum AppTextStyle {
  regular14(TextStyle(fontSize: 14, height: 1.40)),
  regular16(TextStyle(fontSize: 16, height: 1.24, fontWeight: FontWeight.w400, fontFamily: 'OpenSans')),

  medium14(TextStyle(fontSize: 14, height: 1.40, fontWeight: FontWeight.w500)),
  medium16(TextStyle(fontSize: 16, height: 1.24, fontWeight: FontWeight.w600, fontFamily: 'OpenSans')),

  bold14(TextStyle(fontSize: 14, height: 1.40, fontWeight: FontWeight.w700)),
  bold16(TextStyle(fontSize: 16, height: 1.24, fontWeight: FontWeight.w700)),
  bold18(TextStyle(fontSize: 18, height: 1.22, fontWeight: FontWeight.w700, fontFamily: 'OpenSans'));

  final TextStyle value;

  const AppTextStyle(this.value);
}