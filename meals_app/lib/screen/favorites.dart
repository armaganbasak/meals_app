import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/meal.dart';
import 'package:flutter_application_2/providers/favorites_provider.dart';
import 'package:flutter_application_2/screen/meals_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Favorites extends ConsumerStatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends ConsumerState<Favorites> {
  @override
  Widget build(BuildContext context) {
    List<Meal> favorites = ref.watch(favoriteMealsProvider);
    
    
    return  Scaffold(
      appBar: AppBar(
    title:  Text(
      "FAVORİLER",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        shadows: [
          Shadow(
            color: Colors.red.shade600, // Gölgelendirme rengi
            offset: const Offset(1, 2), // Gölgelendirme konumu
            blurRadius: 3, // Gölgelendirme yayılımı
          ),
        ],
      ),
    ),
        
        
        ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => ListTile(
           onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MealsDetails(meal: favorites[index]),
              ),
            );
          },
          leading: CircleAvatar(
            backgroundImage: AssetImage(favorites[index].imageUrl),
          ),
          title: Text(favorites[index].name),
          trailing: IconButton(
            icon: const  Icon(Icons.delete),
            onPressed: () {
              ref.read(favoriteMealsProvider.notifier).removeFromFvorites(favorites[index]);
              
            },
          ),
        ),
        itemCount: favorites.length,
      ),
    );
  }
}
