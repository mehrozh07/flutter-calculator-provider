import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatefulWidget {
   String btnText;
  final int fillColor;
  final int textColor;
  final Function onTap;
  final double textSize;
   ButtonWidget(
       {required this.btnText,
      required this.fillColor,
      required this.textColor,
      required this.onTap,
      required this.textSize});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var fontSize = MediaQuery.textScaleFactorOf(context);
    var paddingS = MediaQuery
        .maybeOf(context)
        ?.padding;
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 50,
        height: 50,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor:  Color(widget.fillColor),
            textStyle: TextStyle(color: Color(widget.textColor)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          onPressed: ()=> widget.onTap(widget.btnText),
          child: Text(widget.btnText,
            style: GoogleFonts.rubik(
                textStyle:  TextStyle(
                    fontSize: widget.textSize,
                )
            ),),
        ),
      ),
    );
  }
}
