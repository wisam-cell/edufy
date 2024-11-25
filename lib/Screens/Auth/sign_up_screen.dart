import 'package:edufly/Screens/Auth/sign_in_screen.dart';
import 'package:edufly/Screens/main_screen.dart';
import 'package:edufly/Widgets/my_close_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/navigator_helper.dart';
import '../../Widgets/my_button.dart';
import '../../Widgets/my_text_field.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen>with NavigatorHelper {

  late TextEditingController nameController;
  late TextEditingController passwordContoller;
  late TextEditingController emailContoller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailContoller = TextEditingController();
    passwordContoller = TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    passwordContoller.dispose();
    super.dispose();
  }
  bool selectedSwitch=false;
  @override
  Widget build(BuildContext context) {
    late AppLocalizations applocale =AppLocalizations.of(context)!;
    return  Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
              top: 44.h,
              end: 16.w,
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: MyCloseButton(icon: Icons.close))),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:22.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(applocale.sign_up,style: TextStyle(fontSize: 28.sp, color: Colors.black),)
                  , SizedBox(height: 31.h,),

                  MyTextField(
                    controller: nameController,
                    hint: "Tap your name",
                    filled: nameController.text.isNotEmpty,
                    TextColor: Colors.black,
                    Border_Color: Color(0xffC3D9F5),
                    onChanged: (p0) => setState(() {}),

                    isPhone: false,),
                  SizedBox(height: 17.h,),
                  MyTextField(
                    controller: emailContoller,
                    hint: "Tap your email",
                    filled: true,
                    TextColor: Colors.black,
                    Border_Color: Color(0xffC3D9F5),
                    onChanged: (p0) => setState(() {}),
                    isPhone: false,),
                  SizedBox(height: 17.h,),
                  MyTextField(controller: passwordContoller,
                    hint: "password",
                    filled:false,
                    isPhone: false,
                    isPassword: true,
                    TextColor: Colors.black,
                    onChanged: (p0) => setState(() {}),
                    Border_Color: Color(0xffC3D9F5),),

                  SizedBox(height: 26.h,),


                  MyButton(text: applocale.register,
                    backGroundColor: Theme.of(context).primaryColor,
                    txtColor: Colors.white,
                    on_tap: () => jump(context, to: MainScreen()),
                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(applocale.dont_have_account,style: TextStyle(fontSize:16.sp ,color: Color(0xff7483A0)),),
                      SizedBox(width: 5.w,),
                      InkWell(
                          onTap: () =>jump(context,to:SignInScreen()) ,
                          child: Text(applocale.sign_in,style: TextStyle(fontSize: 16.sp,color:Theme.of(context).primaryColor),))
                    ],
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
