import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izam/appCubit/app_cubit.dart';
import 'package:izam/appCubit/app_states.dart';
import 'package:izam/shared/components/custom_form_field.dart';
import 'package:izam/shared/const.dart';
import 'package:izam/shared/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appCubit = AppCubit.get(context);
   return BlocConsumer<AppCubit,AppStates>(
     listener: (context,state){},
     builder: (context,state){
       return Scaffold(
         body: Center(
           child: SingleChildScrollView(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Image.asset(AppConstant.logoImage),

                 SizedBox(
                   width:Device.screenType == ScreenType.tablet
                       ? 50.w
                       : Device.orientation == Orientation.landscape ? 60.w : 95.w,
                   height: Device.screenType == ScreenType.tablet
                       ? Device.orientation == Orientation.landscape
                       ? 40.w : 35.h :Device.orientation == Orientation.landscape?45.w: 45.h,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisSize: MainAxisSize.min,
                     children: [

                       Card(
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20)
                         ),
                         child:Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Column(
                             children: [
                               const SizedBox(height: 10,),
                               Text("Welcome, log in",style: AppTextStyle.dark28Bold() ,),
                               const SizedBox(height: 20,),
                              Form(
                                key: appCubit.formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextFormField(
                                      controller: appCubit.emailController,
                                      validateText: "Email is required",
                                      hintText: "Email Address",
                                    ),
                                    const SizedBox(height: 20,),

                                    CustomTextFormField(
                                      validateText: "Password is required",
                                      hintText: "Password",
                                      controller: appCubit.passwordController,
                                    ),
                                  ],
                                ),
                              ),
                               Align(
                                   alignment: Alignment.centerRight,
                                   child: TextButton(
                                       onPressed: (){},
                                       child: Text("Forgot Password?",style: AppTextStyle.dark14Bold() ,))),
                               TextButton(
                                   style: ButtonStyle(
                                       minimumSize: MaterialStateProperty.resolveWith((states) =>
                                       const Size(double.infinity, 50)),
                                       backgroundColor: MaterialStateProperty.resolveWith((states) =>
                                       const Color.fromRGBO(24,119,242,1))
                                   ),
                                   onPressed: (){
                                     //appCubit.login(context);
                                     if(appCubit.formKey.currentState!.validate()){

                                     }
                                   },
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text("Login",style: AppTextStyle.white16Med(),),
                                       Text("Sign In",style: AppTextStyle.white16Med(),),
                                     ],
                                   ))

                             ],
                           ),
                         ),
                       )

                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
       );
     },
   );
  }
}
