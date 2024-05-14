import 'package:fatem_users/Features/Categories/data/models/categories_enum.dart';
import 'package:flutter/foundation.dart';

class CategoryModel {
  final CategoriesEnum categoriesEnum;
  final String title;

  CategoryModel({required this.categoriesEnum, required this.title});
}
