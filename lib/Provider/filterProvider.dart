import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'mealsProvider.dart';


enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterNotifier extends StateNotifier<Map<Filter,bool>> {
  FilterNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  void setFilters(Map<Filter,bool> chosenFilters) {
    state=chosenFilters;
  }
  void setFilter(Filter filter,bool isActive) {
    state={... state,filter:isActive};
  }
}

final filterProvider =
StateNotifierProvider<FilterNotifier, Map<Filter,bool>>((ref) {
  return FilterNotifier();
});


final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final Map<Filter, bool> activeFilter = ref.watch(filterProvider);
  return meals.where((meal) {
    if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});