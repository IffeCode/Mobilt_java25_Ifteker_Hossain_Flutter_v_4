import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/recipe.dart';

class RecipeApi {
  Future<List<Recipe>> searchRecipes(String query) async{
  
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$query');

    final response = await http.get(url);

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if(data['meals'] == null) {
        return [];
      }

      return (data['meals'] as List)
      .map((meal) => Recipe.fromJson(meal))
        .toList();

    } else {
      throw Exception('Failed to load recipes');
    }

  }

}