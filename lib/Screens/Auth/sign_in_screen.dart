
import 'package:edufly/Cache/cache_controller.dart';
import 'package:edufly/Helpers/navigator_helper.dart';
import 'package:edufly/Screens/Auth/sign_up_screen.dart';
import 'package:edufly/Screens/main_screen.dart';
import 'package:edufly/Widgets/my_button.dart';
import 'package:edufly/Widgets/my_text_field.dart';
import 'package:edufly/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/my_close_button.dart';
class SignInScreen extends StatefulWidget {

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>with NavigatorHelper {

 late TextEditingController mobileController;
 late TextEditingController passwordContoller;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobileController = TextEditingController();
    passwordContoller = TextEditingController();
  }
    @override
  void dispose() {
    // TODO: implement dispose
      mobileController.dispose();
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
                  Text(applocale.sign_in,style: TextStyle(fontSize: 28.sp, color: Colors.black),)
                 , SizedBox(height: 31.h,),
                  MyTextField(controller: mobileController,hint: "845218",filled: true,
                    TextColor: Colors.black,Border_Color: Color(0xffC3D9F5),),
                  SizedBox(height: 25.h,),
                  MyTextField(controller: passwordContoller,
                    hint: "password",
                    filled:false,
                    isPhone: false,
                    TextColor: Colors.black,
                    Border_Color: Color(0xffC3D9F5),),
                  SizedBox(height: 25.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Switch(
                            activeColor: Colors.blue,
                            value: selectedSwitch,
                             onChanged: (po) {
                             setState(()=> selectedSwitch=po
                             );
                          },),
                          Text(applocale.remind_me,style: TextStyle(color: Colors.black,fontSize: 13.sp),)
                        ],
                      ),
                      Text(applocale.forget_me,style: TextStyle(color:Color(0xff33A6FF) ,fontSize:13.sp ),)
                    ],
                  ),
                  SizedBox(height: 25.h,),

                   /// Login button
                  MyButton(
                    text: applocale.login,
                    backGroundColor: Theme.of(context).primaryColor,
                    txtColor: Colors.white,
                   // on_tap: () async =>await _performLogin(),
                      on_tap: ()=>jump(context, to: MainScreen()),

                  ),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   Text(applocale.dont_have_account,style: TextStyle(fontSize:16.sp ,color: Color(0xff7483A0)),),
                      SizedBox(width: 5.w,),
                      InkWell(
                        onTap: () =>jump(context,to: SignUpScreen()) ,
                          child: Text(applocale.sign_up,style: TextStyle(fontSize: 16.sp,color:Theme.of(context).primaryColor),))
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
///
 ///
 ///






///
  Future<void> _performLogin() async{
    if(_checkData()==true){
      await _Login();
    }
  }
 Future<void> _Login() async{
    // SharedPreferences cache = await SharedPreferences.getInstance();
    // cache.setBool('loggedIn', true);

  await CacheController().setData(CacheKeys.loggedIn, true);
    jump(context, to: MainScreen(),relpace: true);


 }

  bool _checkData(){
    if(mobileController.text.isEmpty){
      return false;
    }else if (passwordContoller.text.isEmpty){
      return false;
    }else{return true;}
  }


}
