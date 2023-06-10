import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izam/appCubit/app_states.dart';
import 'package:izam/shared/localDbHelper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitState());
  static AppCubit get(context)=>BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dbHelper = DatabaseHelper();

  Future<void> login(context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final isValidEmail = isEmailValid(email);

    final isValidPassword = isPassValid(password);


    if (isValidEmail && isValidPassword) {
      final existingRecordCount = await dbHelper.updateLoginRecord(email, password);
      if (existingRecordCount == null) {
        await dbHelper.insertLoginRecord(email, password);
      }
      int?  loginCount = 0;
      final loginHistory  = await dbHelper.getAllLoginRecords();

      for (var element in loginHistory) {
        if(element["password"] == password && element["email"] == email  ){
          loginCount =  int.tryParse(element["loginCount"].toString());
        }
      }

      showSnackBar(context, 'Login successful \n LoginCount : $loginCount');
    } else {
      showSnackBar(context, 'Invalid email or password');
    }
  }

  Future<void> showSnackBar(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }


  bool isEmailValid(email){
    return RegExp(r'^[a-zA-Z]+\.[0-9]+@izam\.co$').hasMatch(email);
  }


  bool isPassValid(String password) {
    RegExp passwordRegex = RegExp(r'^(?=.*[0-9])(?=.*[!$#^*]).{8,}$');
    return passwordRegex.hasMatch(password);
  }
}