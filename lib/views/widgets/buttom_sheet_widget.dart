import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notes_two_app/logic/note_cubit.dart';
import 'package:notes_two_app/models/category_model.dart';
import 'package:notes_two_app/utils/app_style.dart';
import 'package:notes_two_app/views/widgets/custom_text_form_field.dart';

class ButtomSheetWidget extends StatelessWidget {
  const ButtomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
      if (state is NoteSuccess) {
        Navigator.pop(context);
           
      }else if (state is NoteFalier) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.toString())));
      }
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 5,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "What do you want to add",
                style: AppStyle.bold24.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormFeild(
                  controller: context.read<NoteCubit>().noteController,
                  icon: const Icon(Iconsax.note),
                  title: 'Add Your Note',onSubmitted: (p0) {
                    context.read<NoteCubit>().noteController.clear();
                  },
                  
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton(
                  dropdownColor: Color(0xffF0F0F0),
                  hint: Text(
                    context.read<NoteCubit>().selectNoteCategory,
                    style: AppStyle.bold14,
                  ),
                  items: List.generate(categories.length, (index) {
                    return DropdownMenuItem(
                      child: Text(categories[index].name),
                      value: categories[index].name,
                    );
                  }),
                  onChanged: (value) {
                    context.read<NoteCubit>().selectNoteCategory = value!;
                  }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      context.read<NoteCubit>().addNote();
                      context.read<NoteCubit>().featchNotes();
                   
                    },
                    child:state is NoteLoading? const Center(child: CircularProgressIndicator(color: Colors.white,)):Text(
                      "Add Note",
                      style: AppStyle.bold24
                          .copyWith(color: Colors.white, fontSize: 20),
                    )),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        );
      },
    );
  }
}
