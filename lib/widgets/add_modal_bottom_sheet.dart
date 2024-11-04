import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/add_note/add_note_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class AddModalBottomSheet extends StatelessWidget {
  const AddModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if(state is AddNoteFailure)
            {
              print('failured ${state.errMessege}');
            }
            else if(state is AddNoteSuccess){
              Navigator.pop(context);
            }
          },
          
          builder: (context, state) {

            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ?true:false,
              child: AddNoteForm());
          },
        ),
      ),
    );
  }
}
