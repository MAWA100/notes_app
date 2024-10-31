import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class AddModalBottomSheet extends StatelessWidget {
  const AddModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 28,),
          CustomTextField()
        ],
      ),
    );
  }
}