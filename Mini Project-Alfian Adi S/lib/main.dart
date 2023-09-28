import 'package:flutter/material.dart';
import 'package:summitrent_miniproject/components/components.dart';
import 'package:summitrent_miniproject/ui/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mini Project",
      theme: ThemeData(
        primaryColor: ColorPath.primary,
        scaffoldBackgroundColor: ColorPath.background,
        fontFamily: 'Poppins',
      ),
      home: HomeScreen(),
      // onGenerateRoute: RouteConfig.onGenerateRoute,
    );
  }
}
