import 'package:edufly/Helpers/style_helper.dart';
import 'package:edufly/Models/main_screen_item.dart';
import 'package:edufly/Widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Helpers/navigator_helper.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>with StyleHelper, NavigatorHelper {
  late AppLocalizations applocale = AppLocalizations.of(context)!;
  List <MainScreenItem> items = [
    MainScreenItem(color:Color(0xffFFF3C7), image:'assets/images/lower_primary.svg', title:'lower primary'),
    MainScreenItem(color: Color(0xffFFE3F6), image: 'assets/images/upper_primary.svg', title: 'Upper primary'),
    MainScreenItem(color: Color(0xffC6FAFF), image: 'assets/images/highSchool.svg', title: 'high Scool'),
    MainScreenItem(color: Color(0xffCEE0FF), image: 'assets/images/higher_secandery.svg', title:'higher secondary'),
  ];
  int selectedIndex=0;

  late TextEditingController searchEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchEditingController = TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    searchEditingController.dispose();
    super.dispose();
  }
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

    @override
  Widget build(BuildContext context) {
      late AppLocalizations applocale = AppLocalizations.of(context)!;
    return  Scaffold(
      key: _globalKey,
      body: Stack(
        children: [
          Container(
            height: 330.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: myAppGradient(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 45 .h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(applocale.welcome,style:TextStyle(fontSize: 12.sp,color: Colors.white),),
                        Text('Wesam',style: TextStyle(fontSize: 19.sp,color: Colors.white),)
                      ],
                    ),
                    /// menu drawer
                    InkWell(
                      onTap: () => _globalKey.currentState!.openDrawer(),
                        child: Icon(Icons.menu,color: Colors.white,size: 35.sp,)),
                    ///
                  ],
                ),
                SizedBox(height: 17.h,),
                ///Text Field Search
                _buildSearchBar(),
                ///
                SizedBox(height: 10.h,),
                ///
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 15.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      boxShadow: [
                        BoxShadow(color: Color(0xffCEDBEF).withOpacity(.45),
                            offset: Offset(0, 3),
                            blurRadius: 10)
                      ]
      
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/edufyTxt.svg',height: 25.h,width: 80,),
                            SizedBox(height: 8.h,),
                            Text(applocale.explore_millions_txt,style: TextStyle(fontSize: 16.sp)),
                            SizedBox(height: 19.h,),
                            Container(
                              alignment: Alignment.center,
                              height: 27.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffD7E9FF),
                                  borderRadius: BorderRadius.circular(50.r)
                              ),
                              child: Text(applocale.learnMore,style: TextStyle(fontSize: 8.sp,color: Color(0xff194AD1)),),
                            )
      
                          ],
                        ),
                      ),
                      SizedBox(width: 19.w,),
                      Expanded(
      
                          child: SvgPicture.asset('assets/images/mainScrImg.svg',width: 175.w,)
      
                      )
                    ],
                  ),
                ),
                SizedBox(height: 11.h,),
                /// grid view
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,mainAxisSpacing: 10.h,crossAxisSpacing: 10.w),
      
      
      
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: items[index].color,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(items[index].image,height: 93.h,width: 93.w,),
                            SizedBox(height: 15.h,),
                            Text(items[index].title.toUpperCase(),style: TextStyle(fontSize: 12.sp,color: Colors.black),)
                          ],
                        ),
                      );
                    },),
                )
              ],
            ),
          )
      
        ],
      ),
      drawer: AppDrawer(),
    );
  }



 Widget _buildSearchBar(){
    return TextField(

      controller: searchEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        hintText: applocale.searchEbooks,
        hintStyle: TextStyle(color: Color(0xffBDBDBD),fontSize: 15.sp ),
        prefixIcon: Icon(Icons.search,color: Color(0xffBDBDBD),),
        suffixIcon: Icon(Icons.filter_list_outlined,color: Color(0xffBDBDBD)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide.none
        )

      ),

    );
  }

}
