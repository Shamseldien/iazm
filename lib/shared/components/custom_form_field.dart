import 'package:flutter/material.dart';
import 'package:izam/shared/style.dart';
class CustomTextFormField extends StatelessWidget {
  String? hintText;
  String? validateText;
  TextEditingController controller ;
    CustomTextFormField({required this.hintText,required this.controller,required this.validateText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value){
        if(value!.isEmpty) {
          return validateText;
        }
        return null;
      },
      decoration:  InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: AppTextStyle.purple14Med(),
          fillColor: const Color.fromRGBO(244, 244, 246, 1),
          filled: true
      ),
    );
  }
}
