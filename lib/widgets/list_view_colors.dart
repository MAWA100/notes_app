import 'package:flutter/material.dart';

class ItemColor extends StatelessWidget {
  const ItemColor({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.green,
      radius: 38,
    );
  }
}
 

class ListViewColors extends StatelessWidget {
  const ListViewColors({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 38*2,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        
        return ItemColor();
      }),
    );
  }
}