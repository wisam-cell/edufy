import 'package:edufly/Helpers/navigator_helper.dart';
import 'package:edufly/Screens/Auth/sign_in_screen.dart';
import 'package:edufly/Widgets/my_button.dart';
import 'package:edufly/Widgets/my_close_button.dart';
import 'package:edufly/Widgets/my_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class VerfiyScreen extends StatefulWidget {
  final String mobile ;
  const VerfiyScreen({
    required this.mobile,
    super.key});

  @override
  State<VerfiyScreen> createState() => _VerfiyScreenState();


}

class _VerfiyScreenState extends State<VerfiyScreen> with NavigatorHelper {

String time ='0:08';

late TextEditingController  firstEditingController;
 late TextEditingController secondEditingController;
 late TextEditingController thirdEditingController;
 late TextEditingController fourthEditingController;

 late FocusNode firstNode;
 late FocusNode secondNode;
 late FocusNode thirdNode;
 late FocusNode fourthNode;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstEditingController = TextEditingController();
    secondEditingController = TextEditingController();
    thirdEditingController = TextEditingController();
    fourthEditingController = TextEditingController();

    firstNode =FocusNode();
    secondNode =FocusNode();
    thirdNode =FocusNode();
    fourthNode =FocusNode();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    firstEditingController.dispose();
    secondEditingController.dispose();
    thirdEditingController.dispose();
    fourthEditingController.dispose();

    firstNode.dispose();
    secondNode.dispose();
    thirdNode.dispose();
    fourthNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late AppLocalizations appLocale =AppLocalizations.of(context)!;
    return  Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
            top: 53.h,
              start: 24.w,
              child: MyCloseButton(icon: Icons.arrow_back)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 26.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// TEXT QUASTION
                  Text(appLocale.code_sent.replaceAll('_X_', widget.mobile),
                    style: TextStyle(fontSize: 18.sp,color: Color(0xff090909)),),
                  SizedBox(height: 48.h,),
                  /// numbers

                  /// Text Field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyOtpTextField(
                          controller: firstEditingController,
                          focusNode: firstNode,
                      onChanged: (p0) {
                            secondNode.requestFocus();
                            if(p0.isNotEmpty){
                             secondNode.requestFocus();
                            }
                          }),

                      MyOtpTextField(
                          controller: secondEditingController,
                          focusNode: secondNode,
                          onChanged: (p0) {
                            if(p0.isNotEmpty){
                              thirdNode.requestFocus();
                            }else{
                              firstNode.requestFocus();
                            }

                          }
                      ),

                      MyOtpTextField(
                          controller: thirdEditingController,
                          focusNode: thirdNode,
                      onChanged: (p0) {

                        if(p0.isNotEmpty){
                          fourthNode.requestFocus();
                        }else{
                          secondNode.requestFocus();
                        }
                      }
                      ),

                      MyOtpTextField(
                          controller: fourthEditingController,
                          focusNode: fourthNode,
                      onChanged: (p0) {
                            if(p0.isNotEmpty){
                              Navigator.pop(context);
                            }else{
                              thirdNode.requestFocus();
                            }
                      }
                      ),
                    ],
                  ),

                  SizedBox(height: 60.h,),
                  /// TIMER TEXT
                  Text(appLocale.resendCodeIn.replaceAll('_X_', time),
                    style: TextStyle(fontSize: 16,color: Color(0xff090909).withOpacity(.55)),),
                  SizedBox(height: 25.h,),
                  /// button
                  MyButton(text: appLocale.continueSign,
                    on_tap: () => jump(context, to: SignInScreen()),
                    txtColor: Colors.white,
                    backGroundColor: Theme.of(context).primaryColor,),

                  SizedBox(height: 19.h,),
                  /// secont button
                  MyButton(text: "text",txtColor: Colors.black,
                    borderColor: Color(0xffC3D9F5),)
                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
}
