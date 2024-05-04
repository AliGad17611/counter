import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final double width ;
  final Color background ;
  final String text;
  final int item;
  final Function(int,int) onPressed;

  const Button({
    super.key,
    this.width = double.infinity,
    this.background = Colors.teal,
    required this.text,
    required this.item,
    required this.onPressed
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: () {
          if (item>=0){
            int count = int.parse(text.replaceAll(RegExp(r'[^0-9]'), ''));
            onPressed(item,count);
          }else{
            onPressed(item,0);
          }
        },
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: background,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(5)),
        child:  Text(
          text,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}





