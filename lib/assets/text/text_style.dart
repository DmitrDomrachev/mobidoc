//ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// App text style.
enum AppTextStyle {
  regular16(TextStyle(
    fontSize: 16,
    height: 1.24,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
  )),
  medium10(TextStyle(
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
  )),
  medium14(TextStyle(
    fontSize: 14,
    height: 1.2,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
  )),
  medium16(TextStyle(
    fontSize: 16,
    height: 1.24,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
  )),
  bold18(TextStyle(
    fontSize: 18,
    height: 1.22,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
  )),
  bold22(TextStyle(
    fontSize: 22,
    height: 1.31,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
  ));

  final TextStyle value;

  const AppTextStyle(this.value);
}
