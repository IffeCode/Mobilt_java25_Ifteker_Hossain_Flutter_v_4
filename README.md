# What2Eat

A simple Flutter application developed in Dart as part of a Fullstack Assignment at GritAcademy.

The application demonstrates REST API integration, JSON data handling, recipe searching, filtering, reusable Flutter widgets and navigation between different pages.

## Features

- Recipe search using an external REST API
- Vegetarian-only recipe filter
- Display recipe images
- View detailed recipe information
- Display recipe category and origin
- Display cooking instructions
- Navigation between recipe search and recipe details
- JSON data handling
- Reusable Flutter widgets
- Dart-based Flutter application

## API

### TheMealDB

The application uses TheMealDB API to retrieve recipe information.

The API is used to search for recipes and retrieve information such as:

- Recipe name
- Recipe image
- Category
- Area / origin
- Cooking instructions

API: https://www.themealdb.com/

## Application Structure

The application is divided into models, services, widgets and pages.

### Recipe Model

The `Recipe` model represents recipe information retrieved from the API.

It is used to store and pass recipe data between different parts of the application.

### Recipe API

The `RecipeApi` service is responsible for communicating with the recipe API.

It handles:

- API requests
- JSON responses
- Recipe data
- Converting API data into `Recipe` objects

### Recipe Page

The `RecipePage` is the main page of the application.

Users can:

- Search for recipes
- Enable or disable the vegetarian filter
- View matching recipes

### Recipe Card

The `RecipeCard` is a reusable widget used to display individual recipes.

It displays information such as the recipe image and title.

Selecting a recipe navigates the user to the recipe details page.

### Recipe Details

The `RecipeDetailsPage` displays detailed information about the selected recipe.

Information displayed includes:

- Recipe image
- Recipe title
- Category
- Area / origin
- Cooking instructions

The selected `Recipe` object is passed from the recipe page to the details page.

## Technologies

- Dart
- Flutter
- Android Studio
- REST API
- JSON
- HTTP requests
- Flutter Widgets
- Page navigation
