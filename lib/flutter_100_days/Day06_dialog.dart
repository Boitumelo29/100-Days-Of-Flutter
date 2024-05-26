import 'package:flutter/material.dart';

void main() => runApp(const DialogApp());

class DialogApp extends StatefulWidget {
  const DialogApp({Key? key}) : super(key: key);

  @override
  State<DialogApp> createState() => _DialogAppState();
}

class _DialogAppState extends State<DialogApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dialog App"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showDialogs();
                });
                print("I am here");
              },
              child: const Text("Show Dialog"),
            ),
          ],
        ),
      ),
    );
  }

  showDialogs() {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Welcome"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(ctx);
            },
            child: const Text("Yes"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(ctx);
            },
            child: const Text("No"),
          )
        ],
      ),
    );
  }
}
