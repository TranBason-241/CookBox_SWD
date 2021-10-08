import 'package:app/models/ingredient.dart';
import 'package:app/models/recipe_step.dart';

class Dish {
  String dishID;
  String name;
  String des;
  String picture;
  String category;
  String nutrient;
  double price;
  bool status;
  String parentID;
  int quantity;
  //
  List<RecipeStep> listRecipe;
  List<Ingredient> listIng;

  Dish(
      {required this.dishID,
      required this.name,
      required this.des,
      required this.picture,
      required this.category,
      required this.nutrient,
      required this.price,
      required this.status,
      required this.parentID,
      required this.listRecipe,
      required this.listIng,
      required this.quantity});
}
