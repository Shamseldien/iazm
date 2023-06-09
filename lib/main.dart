import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izam/appCubit/app_cubit.dart';
import 'package:izam/modules/login_screen.dart';
import 'package:izam/shared/localDbHelper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.internal().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ResponsiveSizer(
      builder: (BuildContext context, orientation , screenType )=>MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
            providers:[
              BlocProvider(create: (context)=>AppCubit())
            ],
            child: LoginScreen()),
      ),
    );
  }
}

