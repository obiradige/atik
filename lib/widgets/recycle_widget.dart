import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RecycleWidget extends StatelessWidget {
  const RecycleWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.text2,
      required this.text3,
      this.textEditingController})
      : super(key: key);
  final Widget icon;
  final String text, text2, text3;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        width: w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: SizedBox(width: w * 0.08, child: icon)),
            Container(
              width: 1,
              height:  h * 0.13,
              color: Colors.black54,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: h * 0.005,),
                SizedBox(
                  height: h * 0.029,
                    child: Text(
                  text,
                  style: TextStyle(
                      fontSize:  w * 0.032, fontWeight: FontWeight.w600),
                )),
                
                SizedBox(
                  width:  w * 0.30,
                  height:  h * 0.029,
                  child: TextField(
                    autofocus: true,
                    keyboardType: 
                    const TextInputType.numberWithOptions(decimal: true),
                    controller: textEditingController,              
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize:  w * 0.032),
                        hintText: "0,00 $text2",
                        border: InputBorder.none),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                  ),
                ),
              ],
            ),
            Container(
              width: 1,
              height:  h * 0.13,
              color: Colors.black54,
            ),
            SizedBox(
                width:  w * 0.18,
                child: Text(text3,
                    style: TextStyle(
                        fontSize:  w * 0.032, fontWeight: FontWeight.w400))),
          ],
        ),
      ),
    );
  }
}