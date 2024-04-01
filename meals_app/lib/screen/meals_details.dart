import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/models/meal.dart';
import 'package:flutter_application_2/providers/favorites_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsDetails extends ConsumerStatefulWidget {
  final Meal meal;

  const MealsDetails({Key? key, required this.meal}) : super(key: key);

  @override
  _MealsDetailsState createState() => _MealsDetailsState();
}

class _MealsDetailsState extends ConsumerState<MealsDetails> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          widget.meal.categoryId == '6' ? 'İçecek Adı' : 'Yemek Adı',
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoriteMealsProvider.notifier).toggleMealFavorite(widget.meal);
            },
            icon: Icon(
              favorites.contains(widget.meal) ? Icons.favorite : Icons.favorite_border,
              color: favorites.contains(widget.meal) ? Colors.red : null,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.meal.id,
              child: Image.asset(
                widget.meal.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.meal.categoryId == '6'
                  ? 'İçecek Adı: ${widget.meal.name}'
                  : 'Yemek Adı: ${widget.meal.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (widget.meal.categoryId != '6')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Malzemeler:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.meal.ingredients.map((ingredient) {
                      return Text('- $ingredient');
                    }).toList(),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                RatingBarIndicator(
                  rating: widget.meal.rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 50.0,
                  direction: Axis.horizontal,
                ),
                const SizedBox(width: 10),
                Text(
                  '${widget.meal.rating}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
