import 'package:edufly/Helpers/style_helper.dart';
import 'package:edufly/Models/main_screen_item.dart';
import 'package:edufly/Screens/MainViews/favorite_view.dart';
import 'package:edufly/Screens/MainViews/home_view.dart';
import 'package:edufly/Screens/MainViews/notification_view.dart';
import 'package:edufly/Screens/MainViews/product_view.dart';
import 'package:edufly/Screens/MainViews/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with StyleHelper{




  int selectedIndex=0;
  @override

  Widget build(BuildContext context) {
    late AppLocalizations applocale = AppLocalizations.of(context)!;
    return  Scaffold(
      body:[
        const HomeView(),
        const FavoriteView(),
        const NotificationView(),
        const ProductView(),
        const SettingsView()]    [selectedIndex],

           bottomNavigationBar: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed, // for more than 3
                        selectedItemColor: Color(0xff143ED2),
                        iconSize: 30.h,
                        selectedLabelStyle: TextStyle(fontSize: 10.sp),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 10.sp,
                          color: Color(0xff9195B2)
                        ),

                        unselectedIconTheme: IconThemeData(color: Colors.black),
                        currentIndex: selectedIndex,
                        onTap: (index) =>setState(() {
                          selectedIndex=index;
                        }),


                        items:[
                          BottomNavigationBarItem(
                              icon: const Icon(Icons.home,),
                              label:applocale.today),

                          BottomNavigationBarItem(
                              icon: Icon(Icons.favorite_border),
                              label:applocale.favourite ),

                           BottomNavigationBarItem(
                              icon: Icon(Icons.notifications_active_outlined),
                              label:applocale.notification ),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.category),
                              label:'products' ),
                           BottomNavigationBarItem(
                              icon: Icon(Icons.settings),
                              label: applocale.settings)
                        ]

                    ),

    );
  }
}
