import 'package:edufly/Cache/cache_controller.dart';
import 'package:edufly/DB/db_settings.dart';
import 'package:edufly/Providers/language_provider.dart';
import 'package:edufly/Screens/splash_screen.dart';
import 'package:edufly/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // need before any await cache or api or firebase
  // to initilaize awaits before run app
  ///cache
  await CacheController().initCache();
/// data base
  await DbSettings().initDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
     designSize: Size(375, 812),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(create: (context) => LanguageProvider(),)
          ],
          child: MyMaterialApp(), // extract widget outside bsc the listner cant be notifer
        );
      },
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (BuildContext context, LanguageProvider value, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(

            primaryColor: const Color(0xff3A58F5),
            fontFamily: 'Cairo'
        ),

        localizationsDelegates:AppLocalizations.localizationsDelegates ,
        locale: Locale(value.language),
        supportedLocales:const [
          Locale('ar'),
          Locale("en")
        ],
        home: const SplashScreen(),
      );

    },
    );
  }
}


