
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextStyle{
 static TextStyle dark28Bold() =>  TextStyle(
    fontSize: 23.0.sp,
   fontFamily: "GilroyBold",
   fontWeight: FontWeight.bold,
   color: const Color.fromRGBO(33, 50, 66, 1)
  );

 static TextStyle dark14Bold() =>  TextStyle(
    fontSize: 14.0.sp,
   fontFamily: "GilroyBold",
   fontWeight: FontWeight.bold,
   color: const Color.fromRGBO(33, 50, 66, 1)
  );
 static TextStyle purple14Med() => TextStyle(
    fontSize: 14.0.sp,
     fontFamily: "GilroyMed",
   color: const Color.fromRGBO(117, 121 ,157, 1)
  );

static TextStyle white16Med() => TextStyle(
    fontSize: 16.0.sp,
     fontFamily: "GilroyMed",
   color:   Colors.white
  );



}