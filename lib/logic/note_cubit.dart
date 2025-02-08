import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_two_app/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  String selectNoteCategory = 'Select Note Category 📝';
  TextEditingController noteController = TextEditingController();

  void addNote() {
    emit(NoteLoading());
    NoteModel note = NoteModel(
        noteType: selectNoteCategory,
        content: noteController.text,
        date: DateTime.now().toString());
    try {
      var notesBox = Hive.box<NoteModel>('notes');
      notesBox.add(note);
      emit(NoteSuccess());
    } on Exception catch (e) {
      emit(NoteFalier(MassageError: e.toString()));
    }
  }

  void featchNotes() {
    emit(NoteFeatchLoading());
    try {
      List<NoteModel> notes = [];
      var notesBox = Hive.box<NoteModel>('notes');
      for (var i = 0; i < notesBox.length; i++) {
        notes.add(notesBox.getAt(i)!);
      }
         emit(NoteFeatchSuccess(notes: notes));
    } on Exception catch (e) {
      emit(NoteFeatchFalier(MassageError: e.toString()));


    }
  }
}
