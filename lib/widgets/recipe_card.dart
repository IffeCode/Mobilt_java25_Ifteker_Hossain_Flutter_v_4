import 'package:flutter/material.dart';
import '../models/recipe.dart';


class RecipeCard extends StatelessWidget {

  final Recipe recipe;
  final VoidCallback onTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: InkWell(
        onTap: onTap,

        child: Padding(padding: const EdgeInsets.all(10),

          child: Row(
            children: [
              Image.network(
                recipe.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),

              const SizedBox(width: 12),

              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(recipe.category),

                  const SizedBox(height: 4),

                  Text(recipe.area),
                ],


              ))
            ],
          ),


        )

      ),


    );
  }

}