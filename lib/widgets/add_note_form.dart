import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/list_view_colors.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState>formKey=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        
        children: [
          SizedBox(height: 28,),
          CustomTextField(
            hint: 'Title',
            onSaved: (value)=>title=value,
          ),
          SizedBox(height: 16,),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
            onSaved: (value)=>subTitle=value,
          ),
          SizedBox(height: 30,),
          ListViewColors(),
          SizedBox(height: 50,),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                              isloading: state is AddNoteLoading?true:false,
                              onTap: () {
                                if(formKey.currentState!.validate()){
                                  var currentDate=DateTime.now();
                                  var formattedCurrentDate=DateFormat.yMd().format(currentDate);
                                  formKey.currentState!.save();
                                  var noteModel=NoteModel(title: title!, subTitle: subTitle!, 
                                  date:formattedCurrentDate , 
                                  color: Colors.red.value);
                                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                                }
                                else{
                                  autovalidateMode=AutovalidateMode.always;
                                  setState(() {
                                    
                                  });
                                }
                                
                              },
                            );
            },
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}

