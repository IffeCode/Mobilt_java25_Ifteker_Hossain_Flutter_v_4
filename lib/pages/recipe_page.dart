import 'package:flutter/material.dart';

import '../services/recipe_api.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final TextEditingController searchController = TextEditingController();

  final RecipeApi recipeApi = RecipeApi();

  List<Recipe> recipes = [];

  bool vegetarianOnly = false;
  bool isLoading = false;

  Future<void> searchRecipes() async {
    final query = searchController.text.trim();

    if (query.isEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final results = await recipeApi.searchRecipes(query);

      setState(() {
        recipes = results;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        print(recipe.name);
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