class Recipe {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String imageUrl;

  // Constructor för Recipe
  // Används för att skapa ett Recipe-objekt och kräver
  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageUrl,
});

  // Factory constructor som skapar ett Recipe-objekt
  // från JSON-data som kommer från API:et.
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(

      // Hämtar receptets ID från API:ets "isMeal"-fält
      // Om värdet saknas används en tom sträng
      id: json['isMeal'] ?? '',
      name: json['strMeal'] ?? '',
      category: json['strCategory'] ?? '',
      area: json['strArea'] ?? '',
      instructions: json['strInstructions'] ?? '',
      imageUrl: json['strMealThumb'] ?? '',
    );
  }
}