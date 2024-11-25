import 'package:cached_network_image/cached_network_image.dart';
import 'package:edufly/Cache/cache_controller.dart';
import 'package:edufly/Helpers/navigator_helper.dart';
import 'package:edufly/Providers/language_provider.dart';
import 'package:edufly/Screens/Auth/sign_in_screen.dart';
import 'package:edufly/Screens/my_profile_screen.dart';
import 'package:edufly/enums.dart';
import 'package:edufly/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with NavigatorHelper{

  final color = Color(0xff1D2952);
  @override
  Widget build(BuildContext context) {
    late AppLocalizations applocale = AppLocalizations.of(context)!;
    return Consumer<LanguageProvider>(builder: (BuildContext context, LanguageProvider value, Widget? child) {
      return Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 45.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.menu,color: color,size: 35,),
                  SizedBox(width: 10.w,),
                  Text(applocale.menu,style: TextStyle(color: color,fontSize: 16.sp),),
                  Spacer(),
                  Container(
                    height: 45.h,
                    width: 45.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(22.5.r)
                        shape: BoxShape.circle
                    ),

                    child: CachedNetworkImage(imageUrl: temp_image,fit: BoxFit.cover,
                    ),
                  )
                ],
              ),

              Divider(height: 52.h,),
              SizedBox(height: 14.h,),
              Column(
                children: [
                  _buildListTile(icon:Icons.person, title:applocale.myProfile,on_tap:()=> jump(context, to: MyProfileScreen())),
                  _buildListTile(icon:Icons.lock, title:applocale.changePassword),
                  _buildListTile(icon:Icons.settings, title:applocale.settings),
                  _buildListTile(icon: Icons.language, title: applocale.changeLanguage
                    ,on_tap: () {
                      ///
                    value .changeLanguage();
                    },
                  ),
                  _buildListTile(icon:Icons.list_alt, title:applocale.terms_conditions),
                  _buildListTile(icon:Icons.privacy_tip, title:applocale.privacyPolicy),
                  Divider(height: 70.h,),


                  _buildListTile(
                      logout:true,
                      icon:Icons.logout,
                      title:applocale.log_out,

                      on_tap:() async{

                        await CacheController().getData(CacheKeys.loggedIn);



                      }
                  )
                ],
              )



            ],
          ),
        ),

      );
    },

    );
  }



  }


  InkWell _buildListTile({bool logout =false ,required IconData icon,required String title,Function()? on_tap}) {
    return InkWell(
      onTap: on_tap,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 35),
        child: Row(
          children: [
            Icon(icon,color:logout?Colors.red: Color(0xff4749A0),size: 25.w,),
            SizedBox(width: 11.w,),
            Text(title,style: TextStyle(color: Color(0xff1D2952)),)


          ],

               ),
      ),
    );
  }



