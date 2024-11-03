import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint,  this.maxLines=1,this.onSaved});
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;


  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onSaved:onSaved ,
      validator: (value) {
        if(value?.isEmpty??true){
          return 'field is required';
        }
        else{ return null;}
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:const TextStyle(color: kPrimaryColor),
        border: outLineBorder(),
        enabledBorder: outLineBorder(),
        focusedBorder: outLineBorder(kPrimaryColor)
      ),
    );
  }

  OutlineInputBorder outLineBorder([color]) {
    return OutlineInputBorder(
        borderSide: BorderSide(color:color?? Colors.white,),borderRadius: BorderRadius.circular(16)
      );
  }
}