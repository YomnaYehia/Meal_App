import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.mealItem,
    required this.onSelectedMeal,
  });

  final Meal mealItem;

  String get complexityText {
    var complexity = mealItem.complexity;
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';

      case Complexity.challenging:
        return 'Challenging';

      case Complexity.hard:
        return 'Hard';

      default:
        return 'UnKnown';
    }
  }

  String get affordabilityText {
    var affordability = mealItem.affordability;
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';

      case Affordability.pricey:
        return 'Pricey';

      case Affordability.luxurious:
        return 'Luxurious';

      default:
        return 'UnKnown';
    }
  }

  final void Function(Meal meal) onSelectedMeal;

  @override
  Widget build(BuildContext context) {
    var duration = mealItem.duration;
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => onSelectedMeal(mealItem),
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(mealItem.imageUrl),
                ),
                Positioned(
                  bottom: 35,
                  right: 0,
                  left: 80,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Text(
                          mealItem.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 5),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 5),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
