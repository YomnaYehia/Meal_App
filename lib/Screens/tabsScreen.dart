import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Provider/favoriteProvider.dart';
import 'package:meal_app/Provider/filterProvider.dart';
import 'package:meal_app/Provider/mealsProvider.dart';
import 'package:meal_app/Screens/filterScreen.dart';
import 'package:meal_app/Screens/mealsScreen.dart';
import 'package:meal_app/Widget/mainDrawer.dart';
import '../Models/meal.dart';
import 'CategoriesScreen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
final List<Meal> availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CatigoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Pick your category';

    if (_selectedPageIndex == 1) {
      final List<Meal> favoriteMeal=  ref.watch(favoriteMealProvider);
      activePage = MealsScreen(
        meals: favoriteMeal,
      );
      activePageTitle = 'Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
