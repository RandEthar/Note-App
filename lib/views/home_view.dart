import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notes_two_app/views/widgets/buttom_sheet_widget.dart';
import 'package:notes_two_app/views/widgets/home_view_app_bar.dart';
import 'package:notes_two_app/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      
      floatingActionButton: SizedBox(
        height: 61,width: 61,
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.black,
          onPressed: () {
          showModalBottomSheet(
            
            context: context, builder: (context){
           return ButtomSheetWidget();
          });
        },child: Icon(Iconsax.add,size: 40,color: Colors.white,),),
      ),
      backgroundColor: Colors.white,
      body:const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            SizedBox(height:20 ,),
          HomeViewAppBar()
           , SizedBox(height:20 ,),
          HomeViewBody()
            ],
          ),
        ),
      ),
    );
  }
}



