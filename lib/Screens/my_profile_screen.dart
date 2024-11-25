
import 'package:cached_network_image/cached_network_image.dart';
import 'package:edufly/Helpers/navigator_helper.dart';
import 'package:edufly/Helpers/style_helper.dart';
import 'package:edufly/Screens/edit_screen.dart';
import 'package:edufly/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> with StyleHelper,NavigatorHelper{


  @override
  Widget build(BuildContext context) {
    late AppLocalizations applocale = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 16.sp),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(applocale.myAccount),
        actions: [
          InkWell(
              onTap: () =>jump(context,to: EditScreen()),
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Text(applocale.edit,style: TextStyle(color: Colors.white,fontSize: 16.sp),),
              )),
        ],

        backgroundColor: Colors.transparent,
        elevation: 0,
      ),


      body:Column(
        children: [
          Container(
            height: 300.h,
            width:double.infinity,
            decoration: BoxDecoration(
              gradient: myAppGradient(),
            ),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height:120.h,
                  width: 120.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: CachedNetworkImage(imageUrl: temp_image,fit: BoxFit.cover,),
                              ),
                SizedBox(height: 15.h,),
                Text(temp_name,style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                SizedBox(height: 20.h,),



              ],
            ),

          ),
          Container(
            height: 62.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffF6F7FA).withOpacity(1),
            ),
            child: Row(

              children: [
                SizedBox(width: 16.w,),
                Text(applocale.phone_number,style: TextStyle(color: Color(0xff878787).withOpacity(1),fontSize: 15.sp),),
                Spacer(),
                Text('059-720-7794'),
                SizedBox(width: 20.w,)
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(applocale.information,style: TextStyle(fontSize: 16.sp,color: Color(0xff4749A0)),),
                SizedBox(height: 30.sp,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(applocale.name,style: TextStyle(fontSize: 15.sp,color: Color(0xff878787)),),
                    Text(temp_name,style: TextStyle(fontSize: 16.sp,color: Colors.black),)
                  ],
                ),
                Divider(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(applocale.parentsMobile,style: TextStyle(fontSize: 15.sp,color: Color(0xff878787)),),
                    Text('+195861685',style: TextStyle(fontSize: 16.sp,color: Colors.black),)
                  ],
                ),
                Divider(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(applocale.home,style: TextStyle(fontSize: 15.sp,color: Color(0xff878787)),),
                    Text('+195861685',style: TextStyle(fontSize: 16.sp,color: Colors.black),)
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
