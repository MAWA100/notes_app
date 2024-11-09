import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/list_view_colors.dart';

class EditViewColors extends StatefulWidget {
  const EditViewColors({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewColors> createState() => _EditViewColorsState();
}

class _EditViewColorsState extends State<EditViewColors> {
   late int indexCurrent;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexCurrent=kColors.indexOf(Color(widget.note.color));
  }
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 38*2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        
        return GestureDetector(
          onTap: (){
            indexCurrent=index;
            widget.note.color=kColors[index].value;
            setState(() {
              
            });
          },
          
          child: ItemColor(isActive: index==indexCurrent,color: kColors[index],));
      }),
    );
  }
}
