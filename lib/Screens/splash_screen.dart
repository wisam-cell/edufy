import 'package:edufly/Cache/cache_controller.dart';
import 'package:edufly/Helpers/navigator_helper.dart';
import 'package:edufly/Helpers/style_helper.dart';
import 'package:edufly/Screens/Auth/login_screen.dart';
import 'package:edufly/Screens/Auth/sign_in_screen.dart';
import 'package:edufly/Screens/main_screen.dart';
import 'package:edufly/enums.dart';
import 'package:edufly/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with StyleHelper , NavigatorHelper {
  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),
            () => jump(context, to: MainScreen(),relpace: true));
   // init();
     }
  // Future<void> init() async {
  //
  //    bool? check =  CacheController().getData(CacheKeys.loggedIn);
  //   Future.delayed(const Duration(seconds: 3),
  //   ()=> check == true ?jump(context, to: MainScreen())
  //                      :jump(context, to: SignInScreen()) )
  //   ;
  //
  //
  // }

  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration:  BoxDecoration(
          gradient: myAppGradient(),
        ),
        child: Text('edufly',
          style: TextStyle(
            color: const Color(0xffFFFFFF),
            fontSize: 63.sp,
            fontWeight: FontWeight.bold),),

      ),
    );
  }


}

