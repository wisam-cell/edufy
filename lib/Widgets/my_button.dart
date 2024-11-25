import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
class MyButton extends StatelessWidget {
  final Function()? on_tap;
  final Color? backGroundColor ;
  final Color? borderColor;
  final Color? txtColor;
 final String text ;
 final bool loading;
 final double height;


  const MyButton({
     this.on_tap,
    required this.text,
    this.txtColor,
    this.backGroundColor,
    this.borderColor,
    this.loading=false,
    this.height=52,
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:loading ?null: on_tap,
      child: Container(
        alignment: Alignment.center,
        height: height .h,
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(3.r),
          color: backGroundColor==null? Color(0xffFFFFFF):backGroundColor,
          border: borderColor  !=null?Border.all(color: borderColor!,width: 1.w):null



        ),
        child: loading?CircularProgressIndicator():
          Text(text,style:  TextStyle(
            color:txtColor==null? Theme.of(context).primaryColor:txtColor,
            fontSize: 18.sp,

          )),
          ),
      );

  }
}