import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  final String i;
  const AvatarContainer({
    super.key,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 160.width,
      // height: 160.height,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(i),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
