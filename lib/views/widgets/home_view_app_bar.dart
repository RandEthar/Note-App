import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:notes_two_app/views/widgets/custom_text_form_field.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       const Expanded(
          child: Padding(
            padding:  EdgeInsets.only(left: 20, right: 18),
            child: CustomTextFormFeild(title: 'Search for notes',),
          ),
        ),
      Stack(
        clipBehavior: Clip.none,
         children: [
       const   Icon(Iconsax.notification,color:  Colors.black,),
            Positioned(
              left: 13,top: -2,
              child: Container(
                height: 9,width: 9,
                decoration:const  BoxDecoration(
                     shape: BoxShape.circle,
                     color: Color(0xff2AFF8C)
                ),
              
              ),
            ),

         ],
       ),
       const SizedBox(width: 26,)
      ],
    );
  }
}

