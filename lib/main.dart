import 'package:flutter/material.dart';
import 'pages/recipe_page.dart';

// Programmets startpunkt.
// main() körs när Flutter-applikationen startas
void main() {
  // Startar Flutter-applikationen och visar MyApp
  runApp(const MyApp());
}

// Huvudwidgeten för hela applikationen.
// StatelessWidget används eftersom MyApp inte behöver ändra sitt eget state
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    //Innehåller grundläggande inställingar och struktur för Flutter-applikationen
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'What2Eat',

      //Första sidan som visas när appen startar
      home: const RecipePage(),
    );
  }
}