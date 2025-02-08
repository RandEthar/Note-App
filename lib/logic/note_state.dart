part of 'note_cubit.dart';

sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteLoading extends NoteState {}

final class NoteSuccess extends NoteState {}

final class NoteFalier extends NoteState {
  final String MassageError;

  NoteFalier({required this.MassageError});
}
final class NoteFeatchLoading extends NoteState {}

final class NoteFeatchSuccess extends NoteState {
final List<NoteModel> notes;

  NoteFeatchSuccess({required this.notes});


}
final class NoteFeatchFalier extends NoteState {
  final String MassageError;

  NoteFeatchFalier({required this.MassageError});
}