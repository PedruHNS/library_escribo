import 'package:flutter/material.dart';
import 'package:librady_app/features/library/library_screen.dart';

class EscriboApp extends StatelessWidget {
  const EscriboApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LibraryScreen(),
    );
  }
}