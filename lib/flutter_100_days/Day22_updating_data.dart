import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "Updating Data on Internet ";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: title),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<Album>(
            builder: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: _controller,
                        decoration:
                            const InputDecoration(hintText: "Enter Text"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text("Update Text"),
                      ),
                    ],
                  );
                } else if (snapshot.hasData) {
                  var snackBar = const SnackBar(
                    content: Text("An error has occured"),
                  );
                  return ScaffoldMessenger(child: snackBar);
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
