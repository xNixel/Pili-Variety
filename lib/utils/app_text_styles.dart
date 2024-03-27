import 'package:flutter/material.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';

TextStyle proximaNova() => const TextStyle(fontFamily: 'ProximaNova');
TextStyle h2({required bool fontBold}) {
  return TextStyle(
    color: white,
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: fontBold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle h1() {
  return const TextStyle(
    color: white,
    fontFamily: 'ProximaNova',
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

TextStyle t2() {
  return const TextStyle(
    color: white,
    fontFamily: 'Poppins',
    fontSize: 14,
  );
}

TextStyle t1() {
  return const TextStyle(
    color: white,
    fontFamily: 'ProximaNova',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}
