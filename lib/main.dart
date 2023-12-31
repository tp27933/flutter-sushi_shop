import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/model/shop.dart';
import 'package:sushi/pages/cart_page.dart';
import 'package:sushi/pages/menu_page.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (content)=> Shop(),
      child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
         '/intropage':  (context) => IntroPage(),
         '/menupage':(context) => MenuPage(),
         '/cart':(context)=>
         CartPage()
       
      },
    );
  }
}