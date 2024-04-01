import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/models/meal.dart';
//import 'package:transparent_image/transparent_image.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal, required this.onTap});
  final Meal meal;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap ,
      child: Hero(
        tag: meal.id,
        child: Card(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/15.jpg', 
                fit: BoxFit.cover,
                height: 400,
                width: double.infinity,
              ),
              Image.asset(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: 400,
                width: double.infinity,
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      color: Colors.white.withOpacity(0.5),
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text(
                        meal.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
