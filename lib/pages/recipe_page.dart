import 'package:flutter/material.dart';

import '../services/recipe_api.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';
import 'recipe_details_page.dart';

// StatefulWidget används eftersom sidan innehåller data som kan ändras - veg till icke
class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  // Används för att läsa texten från sökfältet
  final TextEditingController searchController = TextEditingController();

  //Objekt som används för att kommunicera med Recipe Api:et
  final RecipeApi recipeApi = RecipeApi();

  //Lista som innehåller recepten som ska visas
  List<Recipe> recipes = [];

  //Är vegetarian filtret ativerat
  bool vegetarianOnly = false;
  //Appen väntar på svar från API:et
  bool isLoading = false;

  // Söker efter recept med hjälp av användarens sökning
  Future<void> searchRecipes() async {

    final query = searchController.text.trim();

    if (query.isEmpty) {
      return;
    }

    // Visar att appen håller på att ladda data
    setState(() {
      isLoading = true;
    });

    try {
      // Skickar sökningen till API:t och väntar på resultatet
      final results = await recipeApi.searchRecipes(query);

      // Börjar med alla recept som API:t returnerade
      List<Recipe> filteredRecipes = results;

      // Filtrerar resultaten om vegetarian-filtret är aktiverat
      if(vegetarianOnly) {
        filteredRecipes = results.where((recipes) {
          return recipes.category.toLowerCase() == 'vegetarian';
        }).toList();
      }

      //Uppdaterar receptlistan
      setState(() {
        recipes = filteredRecipes;
        isLoading = false;
      });
    } catch (e) {
      //Avslutar laddningen om API anropet misslyckas
      setState(() {
        isLoading = false;
      });

      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    // Scaffold fungerar som grundstruktur för sidan
    return Scaffold(

      // AppBar visas längst upp på sidan
      appBar: AppBar(
        title: const Text('What2Eat'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [

            TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search for a recipe',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Vegetarian only'),

                Switch(
                  value: vegetarianOnly,
                  onChanged: (value) {
                    setState(() {
                      vegetarianOnly = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: searchRecipes,
              child: const Text('Search'),
            ),

            const SizedBox(height: 20),

            if (isLoading)
              const CircularProgressIndicator(),

            if (!isLoading && recipes.isEmpty)
              const Text(
                'Search for a recipe to get started!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            
            if(!isLoading && recipes.isNotEmpty)

              Expanded(
                child: ListView.builder(

                  itemCount: recipes.length,

                  itemBuilder: (context, index) {

                    final recipe = recipes[index];

                    return RecipeCard(
                      recipe: recipe,

                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                        RecipeDetailsPage(recipe: recipe),
                        ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}