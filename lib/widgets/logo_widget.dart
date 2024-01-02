import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final GestureTapCallback onTap;
  const Logo({required this.onTap, super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/images/logos/playerlogo.jpg',
      ),
    );
  }
}