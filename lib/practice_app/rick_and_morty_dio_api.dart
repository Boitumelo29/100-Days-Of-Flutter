import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = "Rick and Morty DIO APP";

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
  var jsonList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: jsonList == null ? 0 : jsonList.lenght,
          itemBuilder: (context, index) {
            if(index == null){
              return ListTile(
                leading: Image.network(jsonList[index]['image']),
                title: Text(jsonList[index]['name']),
                subtitle: Text(jsonList[index]['species']),
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }

  void getData() async {
    try {
      var response = await Dio().get('https://rickandmortyapi.com/api/character');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['results'] as List;
        });
      } else {
        print(response.statusCode);
      }
      // final response = "";
    } catch (e) {
      print(e);
    }
  }
}
