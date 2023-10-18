import 'package:flutter/material.dart';
import 'package:meal_app/Widget/categoryGridItem.dart';
import 'package:meal_app/data/dummy_data.dart';
import '../Models/meal.dart';

class CatigoriesScreen extends StatelessWidget {
  const CatigoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            availableMeals: availableMeals,
          ),
      ],
    );
  }
}
