import 'package:calculator_using_provider/calculation_provider.dart';
import 'package:calculator_using_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'calculator_UI.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()..initialize()),
          ChangeNotifierProvider(create: (_) => CalculationProvider()),
        ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final themeChange = Provider.of<ThemeProvider>(context);
    return Builder(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.green,
              brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
            primarySwatch: Colors.orange,
          ),
          themeMode: themeChange.themeMode,
          home: CalculatorUI(),
        );
      }
    );
  }
}

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);
