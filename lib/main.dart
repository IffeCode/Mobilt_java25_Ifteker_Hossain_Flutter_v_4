import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What2Eat',

      home: const RecipePage(),
    );
  }
}

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  bool vegetarianOnly = false;

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
              onPressed: () {
                print('Search button pressed');
              },
              child: const Text('Search'),
            ),

            const SizedBox(height: 20),

            const Text(
              'Search for a recipe to get started!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}