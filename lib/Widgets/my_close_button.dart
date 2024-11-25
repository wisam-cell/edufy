import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyCloseButton extends StatelessWidget {
  final IconData icon;
  const MyCloseButton({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() =>  Navigator.pop(context),
      child: CircleAvatar(
        radius: 15.r,
        backgroundColor: Color(0xff51526E),
        child: Icon(icon,color: Colors.white,),
      ),
    );
  }
}