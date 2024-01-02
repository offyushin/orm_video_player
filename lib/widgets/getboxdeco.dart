import 'package:flutter/cupertino.dart';

BoxDecoration getBoxDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2A3A7C), Color(0xFF000118)]));
}
