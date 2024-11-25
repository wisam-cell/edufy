import 'package:edufly/Helpers/navigator_helper.dart';
import 'package:edufly/Helpers/style_helper.dart';
import 'package:edufly/Screens/Auth/sm_login_screen.dart';
import 'package:edufly/Screens/Auth/verfiy_screen.dart';
import 'package:edufly/Widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/my_button.dart';



class Welcome {
  late String image ;
  late String title;
  late String subTitle;

  Welcome({required this.image,required this.title,required this.subTitle});

}
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>with StyleHelper,NavigatorHelper {
  late TextEditingController mobileEditingContoller;

  late AppLocalizations applocale = AppLocalizations.of(context)!;


  int selectedPage = 0;
 late List<Welcome> welcomeViews = [
    Welcome(
        image: 'assets/images/login_screen_bg_1.svg',
        title:applocale.welcome_pageView_1_tit,
        subTitle: applocale.welcome_pageView_1_subTit),
    Welcome(
         image: 'assets/images/login_screen_bg_2.svg',
         title: applocale.welcome_pageView_2_tit,
         subTitle: applocale.welcome_pageView_2_subTit
    ),
    Welcome(
        image: 'assets/images/login_screen_bg_3.svg',
        title: applocale.welcome_pageView_3_tit,
        subTitle:applocale.welcome_pageView_2_subTit
    )

  ];

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobileEditingContoller =TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    mobileEditingContoller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    late AppLocalizations applocale = AppLocalizations.of(context)!;
    return  Scaffold(
      body: ListView(
      //shrinkWrap: true,
        children: [
         SizedBox(
           height: MediaQuery.of(context).size.height *0.68,
              child: PageView.builder(

                onPageChanged: (value) {
                  setState(() {
                  selectedPage =value;
                  });
                },
                itemCount: welcomeViews.length,
                itemBuilder: (BuildContext context, int index) {

                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal:52.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(welcomeViews[index].image),
                      SizedBox(height: 64.h,),
                      Text(welcomeViews[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24.sp,color: const Color(0xff1136D2)),),
                      SizedBox(height: 15.h,),
                      Text(welcomeViews[index].subTitle,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(fontSize: 16.sp,color: const Color(0xff797979)))

                    ],
                  ),
                );
                },

              )
          ),
         // PageView.builder(itemBuilder: 3),
          Center(
            child: SizedBox(
              height: 9.h,
              child: ListView.separated(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildChipContainer(index == selectedPage),
                  separatorBuilder: (context, index) => SizedBox(width:11.w),
                  itemCount: welcomeViews.length),
            ),
          ),
         SizedBox(height: 11.h,),
         _buildBottomSection(),

        ],
      ),
    );

  }


  Container buildChipContainer(bool selectedOne) {
    return Container(

              height: 9.h,
              width: 37.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color:selectedOne? Theme.of(context).primaryColor:Colors.transparent
                ,border: selectedOne?null :Border.all(width: 1.w,color: const Color(0xffB0B0B0 ))
                ),
              );
  }
  Widget _buildBottomSection(){
    return Container(
      height: MediaQuery.of(context).size.height *0.28,
          width: double.infinity,
          padding: EdgeInsets.only(
                top: 26.h,
                bottom: 35.h,
                right: 22.w,
                left: 22.w
                            ),
             decoration: BoxDecoration(
             gradient: myAppGradient()
             ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextField(controller: mobileEditingContoller,hint: '8943983474',),
                  SizedBox(height: 20.h,),
                   MyButton(
                     text: applocale.continueSign,
                     on_tap:() => jump(context, to:VerfiyScreen(mobile:mobileEditingContoller.text)),),



  SizedBox(height: 15.h,),

  InkWell(
    onTap: () =>jump(context,to:const SmLoginScreen()) ,
    child: Text(applocale.signUpSplash,
    style:TextStyle(
    color: const Color(0xffFFFFFF),
    fontSize: 16.sp,

    ) ,),
  )

  ],
  ),
  );

  }
}


