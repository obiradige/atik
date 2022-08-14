import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.color2,
    this.isLoading = false,
    this.w,
    this.h,
  });

  final String text;
  final Function onPressed;
  Color color, color2;
  final bool isLoading;
  final double? h;
  final double? w;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: isLoading
          ? null
          : () {
              FocusScope.of(context).unfocus();
              onPressed();
            },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: w ?? width * 0.8,
          minHeight: h ?? height * 0.18,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color2],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
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
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.transparent,
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: w != null ? (w! * 0.065) : (width * 0.065),
                  ),
                ),
        ),
      ),
    );
  }
}
