import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Color TextColor;
  final Color Border_Color;
  final bool filled;
  final bool isPhone;
  final Function(String)? onChanged;
  final bool isPassword;



  const MyTextField({
    required this.controller,
    required this.hint,
     this.TextColor=Colors.white,
    this.Border_Color= const Color(0xffC3D9F5),
    this.filled=false,
    this.isPhone = true,
    this.isPassword=false,
    this.onChanged,

    super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool showPassword=false;
  @override

  Widget build(BuildContext context) {
    return TextField(
       controller: widget.controller,
        onChanged: widget.onChanged,
      obscureText: widget.isPassword && showPassword==false ?true:false,
      
      decoration: InputDecoration(
        // suffixIcon: widget.isPassword?
        // widget.controller.text.isNotEmpty?Icon(Icons.remove_red_eye_rounded)
        //     : Icon(Icons.remove_red_eye_outlined)
        //     :null,
       /// sufix
        suffixIcon: widget.isPassword&&widget.controller.text.isNotEmpty?
       InkWell(
           onTap: () {
             setState(() {
              showPassword =!showPassword;
             });
           },
           child:showPassword? Icon(Icons.visibility_off):Icon(Icons.visibility))
            
            
            :Icon(Icons.check,color: Colors.green,),
       filled: widget.filled,
        fillColor: Color(0xffEAF2FE),
        hintText: widget.hint,
        hintStyle: TextStyle(
            fontSize: 18.sp,
            color: Color(0xffC3CCDB),

        ),

        /// prefix
        prefixIcon:widget.isPhone? IntrinsicHeight( // for vertical divider in row
          child: Row(
            mainAxisSize: MainAxisSize.min, //so row will not occypy whole filed
            children: [
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 10.w),
                child:Text('+1',style: TextStyle(fontSize: 18.sp, color: widget.TextColor),),
              ),
              SizedBox(width: 13.w,),
              VerticalDivider(
                color: widget.TextColor,
                indent: 14.h, // padding in vertical call indent
                endIndent: 14.h,
              )
            ],
          ),
        ):null,
        contentPadding: EdgeInsets.symmetric(horizontal: 13.w),
        
        
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.Border_Color,width: 0.8.w),
          borderRadius: BorderRadius.circular(3.r),
        ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.Border_Color,width: 0.8.w),
            borderRadius: BorderRadius.circular(3.r),

      )

      ),
    style: TextStyle(

      fontSize: 18.sp,
      color: widget.TextColor

    ),

    );
  }
}
