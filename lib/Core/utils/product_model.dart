import '../../Features/Category/Data/category_enum.dart';

class ProductModel
{
  int? id;
  CategoriesEnum? category;
  String? nameArabic;
  String? nameEnglish;
  String? image;
  String? ingredientsArabic;
  String? ingredientsEnglish;
  String? usageArabic;
  String? usageEnglish;
  String? benefitsArabic;
  String? benefitsEnglish;
  int? price;
  int? discount;


  ProductModel({
    this.id,
    this.category,
    this.nameArabic,
    this.nameEnglish,
    this.ingredientsArabic,
    this.ingredientsEnglish,
    this.image,
    this.price,
    this.discount,
  });


}