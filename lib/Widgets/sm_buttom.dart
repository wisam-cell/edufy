import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SmButtom extends StatefulWidget {
  final Color color;
  final String title;
  final String icon;
  const SmButtom({
    required this.color ,
  required this.title,
  required this.icon

    ,super.key});

  @override
  State<SmButtom> createState() => _SmButtomState();
}

class _SmButtomState extends State<SmButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: widget.color,
        border: Border.all()
      ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 16.w,),
        SvgPicture.asset(widget.icon),
        SizedBox(width: 12.3.w,),
        Text(widget.title.toUpperCase(),style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500

        ),)

      ],
    ),

    );
  }
}
