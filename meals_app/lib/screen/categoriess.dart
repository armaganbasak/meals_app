import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/data/category_data.dart';
import 'package:flutter_application_2/models/ccategory.dart';
import 'package:flutter_application_2/screen/favorites.dart';
import 'package:flutter_application_2/screen/meals.dart';
import 'package:flutter_application_2/widgets/category_card.dart';

class Categoriess extends StatelessWidget {
  const Categoriess({Key? key});

  void _changeScreen(Category c, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Meals(category: c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text(
          "HOŞGELDİNİZ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            
            shadows: [
              Shadow(
                color: Colors.grey[800]!, // Gölgelendirme rengi
                offset: const Offset(1, 2), // Gölgelendirme konumu
                blurRadius: 3, // Gölgelendirme yayılımı
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const Favorites()));
            },
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/restoran.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: categories
              .map(
                (e) => CategoryCard(
                  category: e,
                  onCategoryClick: () {
                    _changeScreen(e, context);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
