import 'package:flutter/material.dart';
import '../models/CategoryModel.dart';

import 'WigitCard.dart';

class Categorylist extends StatelessWidget {
  const Categorylist({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: 'general', image: 'assets/images/general.avif'),
    CategoryModel(categoryName: 'sports', image: 'assets/images/sports.avif'),
    CategoryModel(categoryName: 'health', image: 'assets/images/health.avif'),
    CategoryModel(categoryName: 'technology', image: 'assets/images/technology.jpeg'),
    CategoryModel(categoryName: 'business', image: 'assets/images/business.jpg'),
    CategoryModel(categoryName: 'science', image: 'assets/images/science.avif'),
    CategoryModel(categoryName: 'entertainment', image: 'assets/images/entertaiment.avif'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => CardWigit(category: categories[index],)),
    );
  }
}
