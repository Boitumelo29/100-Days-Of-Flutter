import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "Form Submission";
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
  final GlobalKey<FormState> _formKey = GlobalKey();
  String password = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                      label: Text("Email"),
                    ),
                    onFieldSubmitted: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return "Invalid Email";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                      label: Text("Password"),
                    ),
                    onFieldSubmitted: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return "Invalid Email";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Submit"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Your Email is: "),
                      email.isEmpty ? const Text("No email") : Text(email)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Your Password is: "),
                      password.isEmpty
                          ? const Text("No password")
                          : Text(password)
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
