import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Image Picker";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage(title: title));
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? galleryFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Select Image"),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  width: 300,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(child: Wrap());
        });
  }
}
