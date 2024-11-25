import 'package:edufly/Widgets/sm_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../Widgets/my_close_button.dart';

class SmLoginScreen extends StatefulWidget {
  const SmLoginScreen({super.key});

  @override
  State<SmLoginScreen> createState() => _SmLoginScreenState();
}

class _SmLoginScreenState extends State<SmLoginScreen> {

  @override
  Widget build(BuildContext context) {
    late AppLocalizations applocale = AppLocalizations.of(context)!;
    return  Scaffold(

      body: Stack(
       children: [
         PositionedDirectional(
           end: 17.w,
             top: 44.h,
             child: MyCloseButton(icon:Icons.close,)

         ),
         Center(
           child: Padding(
             padding:  EdgeInsets.symmetric(horizontal: 17.w),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SvgPicture.asset('assets/images/edufyTxt.svg',
                   height: 61.h,),
                 SizedBox(height: 31.6.h),
                 Text(applocale.signUp_Sm,
                   style: TextStyle(fontSize: 20 ,color: Color(0xff1D2952)),),
                 SizedBox(height: 21.h,),
                 SmButtom(
                   color: Color(0xff4267B2),
                   icon: "assets/icons/facebook.svg",
                   title: applocale.continue_with_facebook,
                 ),
                 SizedBox(height: 17.h,),
                 SmButtom(
                   color: Color(0xff679EF5),
                   icon: "assets/icons/googleIcon.svg",
                   title: applocale.continue_with_google,
                 ),
                 SizedBox(height: 17.h,),
                 SmButtom(
                   color: Color(0xff29303F),
                   icon: "assets/icons/apple.svg",
                   title: applocale.continue_with_apple,
                 )
               ],
             ),
           ),
         ),
       ],
      ),


    );
  }
}


