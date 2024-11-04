import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,this.onTap,  this.isloading=false});
  final void Function()? onTap;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Center(
          child:isloading?
           SizedBox(height: 24,width: 24, child: CircularProgressIndicator(color :Colors.black))
           : Text('Add',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}