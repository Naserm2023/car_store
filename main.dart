import 'package:car_store_online/home_page.dart';
import 'package:car_store_online/interface-page.dart';
import 'package:car_store_online/item_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
 class MyApp extends StatefulWidget {
   const MyApp({super.key});

   @override
   State<MyApp> createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {
   @override
   Widget build(BuildContext context) {
     return const MaterialApp(
debugShowCheckedModeBanner: false,
       home: InterfacePage(),
     );
   }
 }
