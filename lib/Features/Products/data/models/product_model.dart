import 'package:fatem_users/Features/Categories/data/models/categories_enum.dart';
import 'package:fatem_users/constants/assets.dart';

class ProductModel {
  int? id;

  final CategoriesEnum category;
  final String title;
  final String desc;
  final String img;
  int? price;
  int? discount;
  ProductModel({
    this.id,
    this.price,
    this.discount,
    required this.category,
    required this.title,
    required this.desc,
    required this.img,
  });
}

List<ProductModel> allProduct = [
  ProductModel(
    category: CategoriesEnum.hair,
    title: 'Hair Balm',
    desc: '''Vitamin - E

Indications Protect from Heat Split ends. Hair breakage Damadged and Exhausted Hair
Enriched with argan oil and vitamin E

For Healthy and Shiny Hair''',
    img: Assets.assetsImagesProductsHairBalm,
  ),
  ProductModel(
    category: CategoriesEnum.face,
    title: 'Lip Scrub',
    desc: '''VREACH IN VIT-E, SHEA BUTTER ALMOND OIL''',
    img: Assets.assetsImagesProductsLibscrub,
  ),
  ProductModel(
    category: CategoriesEnum.face,
    title: 'TONER',
    desc: '''Niacinamide, Tea Tree oil

Ph Balance

Moisturising

Pore Tightening

Remove impurities

Sebum-Regulator

Alcohol Free Fragrance and Paraben Free

يرج جيداً قبل الإستخدام''',
    img: Assets.assetsImagesProductsToner,
  ),
  ProductModel(
    category: CategoriesEnum.face,
    title: 'Lib Balm',
    desc: '''Healing Your Libs
Rich in 
Panthenol , Shea Butter, JoJoba oil , Vit-E''',
    img: Assets.assetsImagesProductsLibBalm,
  ),
  ProductModel(
    category: CategoriesEnum.face,
    title: 'Sunscreen',
    desc: '''High protection, Blue light protection

Arti aging Ami oxidant Non comedogenic Fragrance, Paraben, Oil free
Broad spectrum
UVB +UVA I +UVA II

For ALL SKIN''',
    img: Assets.assetsImagesProductsSunScreen,
  ),
  ProductModel(
    category: CategoriesEnum.hair,
    title: 'ROSEJOBA',
    desc: '''Hair oil
Moisturizing Treatment 

SOME INGREDIENTS

Rosemary oil, Sesame oil

Caster Oil and sweet Almond 

يستخدم في تصفيف الشعر اليومي الحمام زيت مرتين في الأسبوع''',
    img: Assets.assetsImagesProductsRosejoba,
  ),
  ProductModel(
    category: CategoriesEnum.hair,
    title: 'Anti Dandruff Formula',
    desc:
        '''Riched with Salicylic Acid For Treatment and clarifying Dandruff''',
    img: Assets.assetsImagesProductsAntidandruffformula,
  ),
  ProductModel(
    category: CategoriesEnum.hair,
    title: 'SHAMPO0',
    desc: '''Anti Dandruff

Riched with Zink pyrithron Alcohol and Paraben Free

For Treatment, Clarifying Dandruff''',
    img: Assets.assetsImagesProductsShampooantidandruff,
  ),
  ProductModel(
    category: CategoriesEnum.hair,
    title: 'SHAMPOO sulfate Free',
    desc:
        '''Riched with Caffeine Aloe vera extract Tance, Alcohol and Paraben Free

For Hair Treatment, Reducing Hair lose Moisturising''',
    img: Assets.assetsImagesProductsShampoofreesulfate,
  ),
  ProductModel(
    category: CategoriesEnum.face,
    title: 'MOISTURISER',
    desc: '''Some ingredients
-yogurt protein
-Vitamin b5
-Avocado oil
Easily spreaded Rapidly absorbed Perfume free Non greasy
Suitable for sensitive skin''',
    img: Assets.assetsImagesProductsMoisturizer,
  ),
  ProductModel(
    category: CategoriesEnum.face,
    title: 'WHITENING CREAM',
    desc: '''For sensetive areas
Delay hair growth
Enriched with Alpha Arbutin, Vit C''',
    img: Assets.assetsImagesProductsWhiteningcream,
  ),
];
