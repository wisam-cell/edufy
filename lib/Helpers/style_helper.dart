import 'package:flutter/material.dart';

mixin StyleHelper{
  LinearGradient myAppGradient() {
    return const LinearGradient(
        begin: AlignmentDirectional.topEnd,
        end: AlignmentDirectional.bottomStart,
        colors:[
          Color(0xff1A13DA),
          Color(0xff01FF90),
        ]
    );
  }


}