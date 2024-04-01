import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/screen/categoriess.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final theme = ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(seedColor:  const Color.fromARGB(92, 151, 49, 9)));
// ThemeData detaylıca araştır.
void main() {
  runApp(
    ProviderScope(child:  MaterialApp(theme: theme, home: const Categoriess(),debugShowCheckedModeBanner: false)));
   
  
}