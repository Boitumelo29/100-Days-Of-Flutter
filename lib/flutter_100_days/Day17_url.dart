import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "url Example";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: title),
    );
  }
}

//url launcher: Flutter plugin for launching a URL. Supports web, phone, SMS, and email schemes.
// you can open the url in the browser or in the app:

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    _launchURLBrowser() async {
      var url = Uri.parse("https://www.geeksforgeeks.org/");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        var snackBar = SnackBar(content: Text("could not launch url"));

        throw ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    _launchURLApp() async {
      var url = Uri.parse("https://www.geeksforgeeks.org/");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        var snackBar = SnackBar(content: Text("could not launch url"));

        throw ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 250,
              ),
              const Text(" Welecome to GFG!"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _launchURLApp();
                },
                child: const Text("Open in App"),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchURLBrowser();
                },
                child: const Text("Open Browser"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
