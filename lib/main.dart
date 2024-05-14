import 'package:fatem_users/Features/Categories/data/models/categories_enum.dart';
import 'package:fatem_users/Features/Home/Presentation/Controller/Cubits/Products/products_cubit.dart';
import 'package:fatem_users/Features/Products/data/models/product_model.dart';
import 'package:fatem_users/Features/Profile/Controller/Cubits/Languages/languages_states.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/bloc_observer/bloc_observer.dart';
import 'Core/constance.dart';
import 'Core/utils/assets_data.dart';
import 'Features/Auth/presentation/Controller/Auth/auth_cubit.dart';
import 'Features/Auth/presentation/Controller/AuthLocal/auth_cache_network.dart';
import 'Features/Home/Presentation/Controller/Cubits/BottomNavBar/bottom_nav_cubit.dart';
import 'Features/Home/Presentation/Views/home_view.dart';
import 'Features/Profile/Controller/Cubits/Languages/language_cubit.dart';
import 'firebase_options.dart';
import 'package:intl/intl.dart';
import 'Features/Splash/presentation/views/splash_view.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  token = CacheNetwork.getCacheData(key: "token");
  name = CacheNetwork.getCacheData(key: "name");
  email = CacheNetwork.getCacheData(key: "email");
  phone = CacheNetwork.getCacheData(key: "phoneNumber");
  cachedAvatar = CacheNetwork.getCacheData(key: "avatarPath");
  cachedLang = CacheNetwork.getCacheData(key: "lang");

  //adding HomePage Index to the queue
  currentPageIndex.clear();
  currentPageIndex.addFirst(3);

  //Initialize tempList
  tempProduct =
  [
    ProductModel(nameArabic: "مزيل عرق",nameEnglish: "Deodorant",img: AssetsData.deodorant, category: CategoriesEnum.body, desc: ''),
    ProductModel(nameArabic: "حمض الهيالورونيك",nameEnglish: "Hyaluronic Acid",img: AssetsData.hyaluronicAcid, category: CategoriesEnum.body, desc: ''),
    ProductModel(nameArabic: "مرطب شفائف",nameEnglish: "Lip Balm",img: AssetsData.lipBalm, category: CategoriesEnum.body, desc: ''),
    ProductModel(nameArabic: "مرطب",nameEnglish: "Moisturizer",img: AssetsData.moisturizer, category: CategoriesEnum.body, desc: ''),
    ProductModel(nameArabic: "شامبو خالي من الكبريت",nameEnglish: "Shampoo Free Sulfate",img: AssetsData.shampooFreeSulfate, category: CategoriesEnum.body, desc: ''),
    ProductModel(nameArabic: "صابون",nameEnglish: "Soap",img: AssetsData.soap, category: CategoriesEnum.body, desc: ''),
    ProductModel(nameArabic: "منظف شفائف",nameEnglish: "Toner",img: AssetsData.toner, category: CategoriesEnum.body, desc: ''),
    ProductModel(nameArabic: "كريم تفتيح",nameEnglish: "Whitening Cream",img: AssetsData.whiteningCream, category: CategoriesEnum.body, desc: ''),
  ];

  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
    BlocProvider<LangCubit>(create: (context) => LangCubit()),
    BlocProvider<ProductsCubit>(create: (context) => ProductsCubit()),
    BlocProvider<BottomNavCubit>(create: (context) => BottomNavCubit()),
  ], child: const FatemUser()));
}

class FatemUser extends StatelessWidget {
  const FatemUser({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // This Method is controlling the status bar appearance.
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    // MultiBlocProvider is controlling all app Blocs.
    return BlocBuilder<LangCubit, LangStates>(builder: (context, state) {
      if (cachedLang != "" && state is! SelectedLangState) {
        locale = Locale(cachedLang!);
      } else if (state is SelectedLangState) {
        locale = state.locale;
      } else {
        locale = Locale(Intl.getCurrentLocale());
      }

      return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            locale: locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            home: const HomeView(),
          );
        },
      );
    });
  }
}
