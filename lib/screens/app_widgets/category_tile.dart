import 'package:flutter/material.dart';

import '../../constants/custom_fontSize.dart';

class CategoryTile extends StatelessWidget {
  final String category;

  const CategoryTile({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            'assets/${category.toLowerCase()}.png',
            fit: BoxFit.fill,
            height: 150,
            width: 200,
          ),
        ),
        Positioned(
            top: 60,
            bottom: 0,
            left: 60,
            right: 0,
            child: Text(
              category,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: CustomFontSize.small,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
