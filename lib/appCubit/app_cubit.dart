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
      final loginCount = await dbHelper.getAllLoginRecords();
      print(loginCount);

      showSnackbar(context, 'Login successful');
    } else {
      showSnackbar(context, 'Invalid email or password');
    }
  }

  Future<void> showSnackbar(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  bool isEmailValid(email){
   return RegExp(r'^[a-zA-Z]{3}\.\d{4}@izam\.co$').hasMatch(email);
  }

  bool isPassValid(password){
   return RegExp(r'^(?=.*\d)(?=.*[!$#^*])[a-zA-Z\d!$#^*]{8,}$').hasMatch(password);
  }


}