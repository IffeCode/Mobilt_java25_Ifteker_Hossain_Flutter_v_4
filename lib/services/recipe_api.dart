import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/recipe.dart';

class RecipeApi {
  // Söker efter recept via TheMealDB API
  // query är det användaren skriver i sökfältet
  Future<List<Recipe>> searchRecipes(String query) async{

    //API-endpointen som används för att söka efter recept
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$query');

    // Skickar en GET-request till API:et
    final response = await http.get(url);

    //Kontrollerar Statuskod ifall Get request lyckas
    if(response.statusCode == 200) {

      // Omvandlar JSON-svaret från API:et till Dart-data
      final data = jsonDecode(response.body);

      //Om API:et inte lyckas hitta något recept, returneras null
      // på "meals". Då returnerar vi en tom lista istället
      if(data['meals'] == null) {
        return [];
      }


      // Hämtar listan med recept från API-svaret.
      // Varje recept omvandlas från JSON till ett Recipe-objekt
      // genom Recipe.fromJson()
      return (data['meals'] as List)
      .map((meal) => Recipe.fromJson(meal))
        .toList();

    } else {
      throw Exception('Failed to load recipes');
    }

  }

}