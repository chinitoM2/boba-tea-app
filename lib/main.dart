import 'package:boba_tea_app/models/menu.dart';
import 'package:boba_tea_app/pages/home_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart'; // Import rendering to access debugPaintSizeEnabled
import 'package:provider/provider.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => BobaTeaMenu(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
        ),
        home: const HomePage(),
      ),
    );
  }
}
