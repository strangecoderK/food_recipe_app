import 'package:flutter/material.dart';


class IconBox extends StatelessWidget {
  final String iconImage;

  const IconBox({super.key, required this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Image.asset(
            iconImage,
            width: 30,
          ),
        ),
      ),
    );
  }
}
