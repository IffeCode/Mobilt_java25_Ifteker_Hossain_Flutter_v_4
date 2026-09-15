import 'package:flutter/material.dart';

import '../models/recipe.dart';

class RecipeDetailsPage extends StatelessWidget{
  final Recipe recipe;

  const RecipeDetailsPage({
    super.key,
    required this.recipe,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),

      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Image.network(
              recipe.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            Text(
              recipe.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Category: ${recipe.category}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Area: ${recipe.area}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Instructions',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              recipe.instructions,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],

        ),
        ),
      ),

    );
  }


}