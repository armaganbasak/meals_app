// 2 Yapı

// Notifier- Provider

// Notifier => Dışarıdan aldıgı aksiyonla depoyu değiştiren mekanizma
// Provider => Depoyu dış dünyaya açan mekanizma

import 'package:flutter_application_2/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  void toggleMealFavorite(Meal meal) {

    //deponun verisine ulaşmak
    if(state.contains(meal)) {
      //state.remove(meal);
      state = state.where((element) => element.id != meal.id).toList();
    }

    else {
      //state.add(meal);
      state = [...state, meal];
    }
  }

  void removeFromFvorites(Meal meal) {
    if(state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
    }
  }


}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) => FavoriteMealNotifier());