import 'package:flutter/material.dart';

import '../models/recipe.dart';

// StatelessWidget används eftersom sidan bara visar information och inte behöver ändra sin egen data
class RecipeDetailsPage extends StatelessWidget{

  // Tar emot receptet som ska visas på detaljsidan
  final Recipe recipe;

  //Constructor för RecipeDetailPage
  const RecipeDetailsPage({
    super.key,
    required this.recipe,
});

  @override
  Widget build(BuildContext context) {
    // Scaffold fungerar som grundstruktur för sidan
    return Scaffold(
      //AppBar visas längst upp på detaljsidan
      appBar: AppBar(
        title: Text(recipe.name),
      ),

      // SingleChildScrollView gör att användaren kan scrolla
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16.0),

        child: Column(

          // Placerar innehållet från vänster sida
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Image.network(
              recipe.imageUrl,
              width: double.infinity,
              height: 250,
              // Anpassar bilden så att hela området fylls
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