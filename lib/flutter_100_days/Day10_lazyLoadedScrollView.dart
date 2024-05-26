import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "Lazy Loader";

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
  @override
  Widget build(BuildContext context) {
    List<int> data = [];
    int currentLength = 0;

    final int increment = 10;
    bool isLoading = false;

    Future<void> loadMore() async {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));
      for (var i = 0; i <= currentLength + increment; i++) {
        data.add(i);
      }

      setState(() {
        isLoading = false;
        currentLength = data.length;
      });
    }

    @override
    void initState() {
      loadMore();
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(widget.title),
      ),
      body: LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: () => loadMore(),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return DemoItem(position: index);
            }),
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  final int position;
  const DemoItem({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("The position is $position"),
          const SizedBox(),
          const Text("GeeksforGeeks.org was created with a goal "
              "in mind to provide well written, well "
              "thought and well explained solutions for selected"
              " questions. The core team of five super geeks"
              " constituting of technology lovers and computer"
              " science enthusiasts have been constantly working"
              " in this direction .")
        ],
      ),
    );
  }
}
