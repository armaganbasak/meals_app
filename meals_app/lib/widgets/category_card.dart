import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/models/ccategory.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, required this.onCategoryClick});
  final Category category;
  final void Function() onCategoryClick;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          onCategoryClick();
        },
         child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(category.imageUrl2), 
              fit: BoxFit.cover,
              ),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.9),
                category.color.withOpacity(0.3),
              ],
            ),
            borderRadius: BorderRadius.circular(100), 
          ),
          padding: const EdgeInsets.all(20), 
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              category.name,
              textAlign: TextAlign.center, 
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: Colors.white, 
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5), 
                    offset: const Offset(2, 2),
                    blurRadius: 3,
                  )
                ]
              ),
            ),
          )
        ),
      ),
    );
  }
}
