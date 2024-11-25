import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyOtpTextField extends StatefulWidget {
   final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String)? onChanged;
  const MyOtpTextField({
    required this.controller,
    required this.focusNode,
    required this.onChanged,

    super.key});

  @override
  State<MyOtpTextField> createState() => _MyOtpTextFieldState();
}

class _MyOtpTextFieldState extends State<MyOtpTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.h,
      height: 65.h,
      child: TextField(
        maxLength: 1,
        controller:widget.controller ,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        cursorColor: Colors.transparent,

        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffE5F0FE),
          counter: SizedBox.shrink(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()
        ),

      style: TextStyle(
        color: Colors.black,
        fontSize: 30.sp,
        height: .8.h
      ),
      
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: const Color(0xffB5D0F3) ,width: .7.w)
        );
  }
}
