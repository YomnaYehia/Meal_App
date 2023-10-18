import 'package:flutter/material.dart';
import 'package:meal_app/Screens/mealDetailScreen.dart';
import 'package:meal_app/Widget/mealItem.dart';
import '../Models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map(
              (meal) => MealItem(
                mealItem: meal,
                onSelectedMeal: (Meal meal) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => MealDetailsScreen(
                        meal: meal,
                      ),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
