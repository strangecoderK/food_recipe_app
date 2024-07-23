import 'package:flutter/material.dart';

class SmallBox extends StatelessWidget {
  final String image;

  const SmallBox({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Image.network(
        image,
        width: 47,
      ),
    );
  }
}
