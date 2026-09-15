import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeApi {
  Future<List<dynamic>> searchRecipes(String query) async{
  
    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$query');

    final response = await http.get(url);

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data['meals'] ?? [];
    } else {
      throw Exception('Failed to load recipes');
    }

  }

}