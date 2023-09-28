import 'package:flutter/material.dart';
import 'package:summitrent_miniproject/components/components.dart';

class CardCategory extends StatelessWidget {
  final CategoryModel category;

  const CardCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Image.asset(category.image),
        ),
        SizedBox(height: 8),
        Text(
          category.title,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
