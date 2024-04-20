import 'package:fatem_users/Features/Profile/Controller/Cubits/Languages/languages_states.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/bloc_observer/bloc_observer.dart';
import 'Core/constance.dart';
import 'Features/Auth/presentation/Controller/Auth/auth_cubit.dart';
import 'Features/Auth/presentation/Controller/AuthLocal/auth_cache_network.dart';
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
 {token = CacheNetwork.getCacheData(key:"token");
 name = CacheNetwork.getCacheData(key:"name");
 email = CacheNetwork.getCacheData(key:"email");
 phone = CacheNetwork.getCacheData(key:"phoneNumber");
 avatar = CacheNetwork.getCacheData(key:"avatarPath");
 cachedLang = CacheNetwork.getCacheData(key: "lang");
 }

  runApp( MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<LangCubit>(create: (context) => LangCubit()),
      ],
      child: const FatemUser()
  )
  );

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
    return BlocBuilder<LangCubit,LangStates>
      (
        builder: (context,state)
        {
              if(cachedLang != "" && state is! SelectedLangState)
              {
                return ScreenUtilInit(
                  designSize: const Size(360, 800),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, child) {
                    return MaterialApp(
                      locale: Locale(cachedLang!),
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      debugShowCheckedModeBanner: false,
                      themeMode: ThemeMode.system,
                      home: const SplashView(),
                    );
                  },
                );
              }
              else if(state is SelectedLangState)
              {
                return ScreenUtilInit(
                  designSize: const Size(360, 800),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, child) {
                    return MaterialApp(
                      locale: state.locale,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      debugShowCheckedModeBanner: false,
                      themeMode: ThemeMode.system,
                      home: const SplashView(),
                    );
                  },
                );
            }
            else
            {
                return ScreenUtilInit(
                  designSize: const Size(360, 800),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, child) {
                    return MaterialApp(
                      locale: Locale(Intl.getCurrentLocale()),
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      debugShowCheckedModeBanner: false,
                      themeMode: ThemeMode.system,
                      home: const SplashView(),
                    );
                  },
                );
            }
        }
      );
  }
}




