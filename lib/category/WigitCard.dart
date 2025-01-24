import 'package:flutter/material.dart';

import '../models/CategoryModel.dart';
import '../screens/CategoryView.dart';

class CardWigit extends StatelessWidget {
  const CardWigit({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return  Categoryview(category: category.categoryName,);
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(category.image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(13),
        ),
        width: 200,
        height: 100,
        child: Center(
          child: Text(
            category.categoryName,
            style: const TextStyle(
              color: Color.fromARGB(255, 248, 253, 255),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
