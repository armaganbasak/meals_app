import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/meal_data.dart';
import 'package:flutter_application_2/models/ccategory.dart';
import 'package:flutter_application_2/models/meal.dart';
import 'package:flutter_application_2/screen/meals_details.dart';
import 'package:flutter_application_2/widgets/meal_card.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    List<Meal> mealList =
        meals.where((element) => element.categoryId == category.id).toList();

    // ListView
     Widget widget = ListView.builder(
      itemBuilder: (context, index) => MealCard(
        meal: mealList[index], 
        onTap: () {
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealsDetails(meal: mealList[index]),
            ),
          );
        },
      ),
      itemCount: mealList.length,
    );

    

    if (mealList.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride hiç bir yemek bulunamadı."),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("${category.name} ", style: const  TextStyle(fontWeight: FontWeight.bold),), 
      backgroundColor: category.color,),
      body: widget,
      
      
    );
  }
}
