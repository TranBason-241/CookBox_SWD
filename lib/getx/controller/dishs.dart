import 'package:app/models/dish.dart';
import 'package:app/models/ingredient.dart';
import 'package:app/models/recipe_step.dart';
import 'package:get/get.dart';

class Dishs extends GetxController {
  final List<Dish> _listDish = [
    Dish(
        dishID: '1',
        name: 'Gà Nướng S',
        price: 200,
        category: 'Gà',
        picture:
            'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
        des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
        nutrient: '1200',
        status: true,
        parentID: '1',
        listRecipe: [
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
              des: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
          RecipeStep(
              repiceID: '2',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
              des:
                  'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
              des: 'Trình Bày Và Thưởng Thức'),
        ],
        listIng: [
          Ingredient(ingID: '1', name: 'ớt', value: 30),
          Ingredient(ingID: '2', name: 'gà', value: 1500),
          Ingredient(ingID: '3', name: 'muối', value: 200),
          Ingredient(ingID: '4', name: 'lá chanh', value: 50),
          Ingredient(ingID: '5', name: 'lá tiêu', value: 30),
        ],
        quantity: 0),
    Dish(
        dishID: '1',
        name: 'Gà Nướng',
        price: 200,
        category: 'Chó',
        picture:
            'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
        des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
        nutrient: '1200',
        status: true,
        parentID: '1',
        listRecipe: [
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
              des: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
          RecipeStep(
              repiceID: '2',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
              des:
                  'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
              des: 'Trình Bày Và Thưởng Thức'),
        ],
        listIng: [
          Ingredient(ingID: '1', name: 'ớt', value: 30),
          Ingredient(ingID: '2', name: 'gà', value: 1500),
          Ingredient(ingID: '3', name: 'muối', value: 200),
          Ingredient(ingID: '4', name: 'lá chanh', value: 50),
          Ingredient(ingID: '5', name: 'lá tiêu', value: 30),
        ],
        quantity: 0),
        Dish(
        dishID: '1',
        name: 'Gà Nướng',
        price: 200,
        category: 'Chó',
        picture:
            'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
        des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
        nutrient: '1200',
        status: true,
        parentID: '1',
        listRecipe: [
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
              des: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
          RecipeStep(
              repiceID: '2',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
              des:
                  'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
              des: 'Trình Bày Và Thưởng Thức'),
        ],
        listIng: [
          Ingredient(ingID: '1', name: 'ớt', value: 30),
          Ingredient(ingID: '2', name: 'gà', value: 1500),
          Ingredient(ingID: '3', name: 'muối', value: 200),
          Ingredient(ingID: '4', name: 'lá chanh', value: 50),
          Ingredient(ingID: '5', name: 'lá tiêu', value: 30),
        ],
        quantity: 0),
        Dish(
        dishID: '1',
        name: 'Gà Nướng',
        price: 200,
        category: 'Chó',
        picture:
            'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
        des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
        nutrient: '1200',
        status: true,
        parentID: '1',
        listRecipe: [
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
              des: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
          RecipeStep(
              repiceID: '2',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
              des:
                  'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
              des: 'Trình Bày Và Thưởng Thức'),
        ],
        listIng: [
          Ingredient(ingID: '1', name: 'ớt', value: 30),
          Ingredient(ingID: '2', name: 'gà', value: 1500),
          Ingredient(ingID: '3', name: 'muối', value: 200),
          Ingredient(ingID: '4', name: 'lá chanh', value: 50),
          Ingredient(ingID: '5', name: 'lá tiêu', value: 30),
        ],
        quantity: 0),
    Dish(
        dishID: '1',
        name: 'Gà Nướng',
        price: 200,
        category: 'Gà',
        picture:
            'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
        des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
        nutrient: '1200',
        status: true,
        parentID: '1',
        listRecipe: [
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
              des: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
          RecipeStep(
              repiceID: '2',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
              des:
                  'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
              des: 'Trình Bày Và Thưởng Thức'),
        ],
        listIng: [
          Ingredient(ingID: '1', name: 'ớt', value: 30),
          Ingredient(ingID: '2', name: 'gà', value: 1500),
          Ingredient(ingID: '3', name: 'muối', value: 200),
          Ingredient(ingID: '4', name: 'lá chanh', value: 50),
          Ingredient(ingID: '5', name: 'lá tiêu', value: 30),
        ],
        quantity: 0),
    Dish(
        dishID: '1',
        name: 'Gà Nướng',
        price: 200,
        category: 'Gà',
        picture:
            'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
        des: 'gà nướng ngon mê ly khiến người ăn xuýt xoa tán thưởng.',
        nutrient: '1200',
        status: true,
        parentID: '1',
        listRecipe: [
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
              des: 'Trộn ớt, muối lá chanh, tiêu đều với gà'),
          RecipeStep(
              repiceID: '2',
              picture:
                  'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
              des:
                  'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'),
          RecipeStep(
              repiceID: '1',
              picture:
                  'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
              des: 'Trình Bày Và Thưởng Thức'),
        ],
        listIng: [
          Ingredient(ingID: '1', name: 'ớt', value: 30),
          Ingredient(ingID: '2', name: 'gà', value: 1500),
          Ingredient(ingID: '3', name: 'muối', value: 200),
          Ingredient(ingID: '4', name: 'lá chanh', value: 50),
          Ingredient(ingID: '5', name: 'lá tiêu', value: 30),
        ],
        quantity: 0)
  ];

  List<Dish> get items {
    return [..._listDish];
  }

  List<Dish> getType(String type) {
    if (type == 'Gà')
      return _listDish.where((element) => element.category == type).toList();
    // if (type == 2) return _listDish.where((element) => element.type == 2).toList();
    return _listDish.where((element) => element.category == type).toList();
  }
}
