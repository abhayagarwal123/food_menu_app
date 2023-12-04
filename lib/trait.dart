import 'package:flutter/material.dart';

class Trait extends StatelessWidget{
Trait({super.key,required this.icon,required this.type});
  final IconData icon;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.white),SizedBox(width: 5,),
        Text(type, style: TextStyle(
            fontSize: 17, color: Colors.white,fontWeight: FontWeight.w400,),)
      ],
    );
  }
}