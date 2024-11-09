import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/add_note/add_note_cubit.dart';

class ItemColor extends StatelessWidget {
  const ItemColor({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child:isActive? CircleAvatar(
        backgroundColor: Colors.white,
        radius: 38,
        child: CircleAvatar(
        backgroundColor: color,
        radius: 34,
      ), 
      )   
      :  CircleAvatar(
        backgroundColor: color,
        radius: 34,
      ),
    );
  }
}
 

class ListViewColors extends StatefulWidget {
  const ListViewColors({super.key});

  @override
  State<ListViewColors> createState() => _ListViewColorsState();
}

class _ListViewColorsState extends State<ListViewColors> {
  int indexCurrent=0;
  

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
            BlocProvider.of<AddNoteCubit>(context).color=kColors[index];
            setState(() {
              
            });
          },
          
          child: ItemColor(isActive: index==indexCurrent,color: kColors[index],));
      }),
    );
  }
}