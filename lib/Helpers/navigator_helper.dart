import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin NavigatorHelper {
  void jump (BuildContext context,{required Widget to,bool relpace =false}){
    if(relpace == true){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>to ,));
    }else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => to,));
    }
  }

}