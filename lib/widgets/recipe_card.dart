import 'package:flutter/material.dart';
import '../models/recipe.dart';

// Widget som används för att visa ett recept som ett klickbart kort
class RecipeCard extends StatelessWidget {

  //receptet som ska visas i kortet
  final Recipe recipe;

  //Funktion som körs när användaren trycker på kortet
  final VoidCallback onTap;

  //Constructor för recipeCard
  //Används när ett nytt RecipeCard skapas och tar emot
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    //Här byggs receptkortets UI
    return Card(
      //lägger till avstånd mellan varje receptkort
      margin: const EdgeInsets.only(bottom: 12),

      child: InkWell(
        //Kör onTap-Funktionen när användaren trycker på kortet
        onTap: onTap,

          // Skapar avstånd mellan kortets innehåll och dess kanter
        child: Padding(padding: const EdgeInsets.all(10),

          child: Row(
            children: [
              //visar receptets image
              Image.network(
                recipe.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),

              const SizedBox(width: 12),

              //Expanded gör så att kortet håller sig i ett begränsat område
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  //visar receptets namn
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  //visar receptets kategori - vegetarisk m.m.
                  Text(recipe.category),

                  const SizedBox(height: 4),

                  //visar vilket område eller land som receptet kokmmer från
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