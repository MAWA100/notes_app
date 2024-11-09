import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context){return EditNotesView(note: note,);} ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24,bottom: 24,left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,style: TextStyle(fontSize: 26,color: Colors.black),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(note.subTitle,
                style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(.5)),),
              ),
              trailing: IconButton(onPressed: () {
                 note.delete();
                 BlocProvider.of<NotesCubit>(context).featchAllNotes();},
                 icon:Icon( FontAwesomeIcons.trash,size: 24,
              color: Colors.black,)),
        
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24,top: 16),
              child: Text(note.date,
              style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(.5)),),
            )
          ],
        ),
      ),
    );
  }
}