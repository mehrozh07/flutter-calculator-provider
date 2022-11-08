import 'dart:core';
import 'package:calculator_using_provider/button_widget.dart';
import 'package:calculator_using_provider/calculation_provider.dart';
import 'package:calculator_using_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalculatorUI extends StatelessWidget {

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
    final orientation = MediaQuery
        .of(context)
        .orientation;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final calculationProvider = Provider.of<CalculationProvider>(context);
    return  Scaffold(
      backgroundColor: Colors.black.withOpacity(calculationProvider.value),
      appBar: AppBar(
        title: Text(
          "$height x $width $fontSize $paddingS",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer<CalculationProvider>(
              builder: ( context, consumer, child) {
                return Slider(
                    min: 0,
                    max: 1,
                    value: consumer.value,
                    onChanged: (val){
                      consumer.setValue(val);
                    });
              },
            ),
            Container(
              alignment:  Alignment(width/1, height/1),
              child: Padding(
                padding: EdgeInsets.only(right: height /12),
                child: Text(
                  "${calculationProvider.history}",
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: fontSize * 16,
                        color: Colors.white,
                      )),
                ),
              ),
            ),

            Container(
              alignment:  Alignment(width/1, height/1),
              child: Padding(
                padding:  EdgeInsets.all(width/12),
                child: Text(
                  "${calculationProvider.textToDisplay}",
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: fontSize * 48,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  btnText: "AC",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 12,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "C",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "<",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "/",
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  btnText: "9",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "8",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "7",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "X",
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  btnText: "6",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "5",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "4",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "+",
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  btnText: "3",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "2",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "1",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "-",
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  btnText: "+/-",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 12,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "0",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "00",
                  fillColor: 0xFF8ac4d0,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
                ButtonWidget(
                  btnText: "=",
                  fillColor: 0xFFf4d160,
                  textColor: 0xFF000000,
                  textSize: fontSize * 18,
                  onTap: calculationProvider.btnOnClick,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
