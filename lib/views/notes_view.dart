import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_modal_bottom_sheet.dart';
import 'package:note_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context){
            return const AddModalBottomSheet();
          });
        },
        child:const Icon(Icons.add),shape: CircleBorder(),),
      body: const NotesViewBody()
    );
  }
}