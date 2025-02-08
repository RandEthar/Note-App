




import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notes_two_app/utils/app_style.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key, this.icon, required this.title, this.controller,this.onSubmitted
  });
 final Widget?icon;
 final String title;
 final TextEditingController? controller;
final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
    onSubmitted: onSubmitted,
      controller:controller ,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          filled: true,
          fillColor:const Color(0xffF0F0F0),
          hintText:title,
          prefixIcon:icon ??const Icon(Iconsax.search_normal_1),
          hintStyle: AppStyle.regular14.copyWith(
            color: const Color(0xff7C7C7C),
          ),
          enabledBorder:const  OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          focusedBorder:const  OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)))),
    );
  }
}





























