import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/edit_note_list_color.dart';
import 'package:note_app/widgets/list_view_colors.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title,subTitle;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child:  Column(
        children: [
         const SizedBox(height: 40,),
          CustomAppBar(
            onPressed: () {
              widget.note.title=title??widget.note.title;
              widget.note.subTitle=subTitle??widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).featchAllNotes();
              Navigator.pop(context);
            },
            
            title: 'Edit Note', icon: Icons.check),
         const SizedBox(height: 50,),
            CustomTextField(
              hint: widget.note.title,
              onChanged: (p0) {
                title=p0;
              },
            ),
           const SizedBox(height: 16,),
            CustomTextField(
              hint: widget.note.subTitle,
              maxLines: 5,
              onChanged: (p0) => subTitle=p0,
            ),
            SizedBox(height: 16,),
            EditViewColors(note: widget.note,)
        ],
      ),
    );
  }
}
