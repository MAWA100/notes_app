import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/views/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context){return EditNotesView();} ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24,bottom: 24,left: 16),
        decoration: BoxDecoration(
          color: Color(0xffFFCC80),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text('Flutter Tips',style: TextStyle(fontSize: 26,color: Colors.black),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Build your career with Marwa Emam',
                style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(.5)),),
              ),
              trailing: Icon(FontAwesomeIcons.trash,size: 24,color: Colors.black,),
        
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24,top: 16),
              child: Text('May21 ,2024',
              style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(.5)),),
            )
          ],
        ),
      ),
    );
  }
}