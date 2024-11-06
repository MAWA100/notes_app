import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  void initState(){
    BlocProvider.of<NotesCubit>(context).featchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child:  Column(children: [
        SizedBox(height: 40,),
        CustomAppBar(title: 'Notes', icon: Icons.search,),
        Expanded(child: NotesListView())
      ],),
    );
  }
}