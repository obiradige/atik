import 'package:flutter/material.dart';

// 
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({ Key? key,required this.isLoading, required this.text,this.onPressed,required this.minusWidth,required this.color,required this.color2 }) : super(key: key);

  final String text;
  final Function()? onPressed;
  final num minusWidth;
  final Color color,color2;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: isLoading
          ? null
          : () {
              FocusScope.of(context).unfocus();
              onPressed!();
            },
      child: Container(
        
        width: w - minusWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [color,color2],
          ),
          borderRadius: const BorderRadius.all( Radius.circular(50.0)),
           boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 2), // changes position of shadow
      ),
    ],
        ),
        child: Center(
          child: Text(text, style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: w * 0.065),),
        ),
      ),
    );
  }
}