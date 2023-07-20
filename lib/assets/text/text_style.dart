//ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// App text style.
enum AppTextStyle {
  regular12(TextStyle(
    fontSize: 12,
    height: 1.16,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
  )),
  regular14(TextStyle(
    fontSize: 14,
    height: 1.2,
    fontWeight: FontWeight.w400,
    fontFamily: 'OpenSans',
  )),
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
  medium12(TextStyle(
    fontSize: 12,
    height: 1.19,
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
  medium18(TextStyle(
    fontSize: 18,
    height: 1.41,
    fontWeight: FontWeight.w600,
    fontFamily: 'OpenSans',
  )),
  bold18(TextStyle(
    fontSize: 18,
    height: 1.22,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
  )),
  bold20(TextStyle(
    fontSize: 20,
    height: 1.36,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
  )),
  bold22(TextStyle(
    fontSize: 22,
    height: 1.31,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
  )),
  bold24(TextStyle(
    fontSize: 24,
    height: 1.36,
    fontWeight: FontWeight.w700,
    fontFamily: 'OpenSans',
  )),
  bold30(TextStyle(
  fontSize: 30,
  height: 1.36,
  fontWeight: FontWeight.w700,
  fontFamily: 'OpenSans',
));

  final TextStyle value;

  const AppTextStyle(this.value);
}
