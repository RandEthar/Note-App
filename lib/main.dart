import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_two_app/logic/note_cubit.dart';
import 'package:notes_two_app/models/note_model.dart';
import 'package:notes_two_app/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Notes App',
          theme: ThemeData(fontFamily: 'Product Sans'),
          home: const HomeView()),
    );
  }
}
