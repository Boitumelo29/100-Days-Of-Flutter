import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = "Expansion Tile Card";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpansionTileApp(title: title),
    );
  }
}

class ExpansionTileApp extends StatefulWidget {
  final String title;
  const ExpansionTileApp({super.key, required this.title});

  @override
  State<ExpansionTileApp> createState() => _ExpansionTileAppState();
}

class _ExpansionTileAppState extends State<ExpansionTileApp> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTileCard(
            key: cardB,
            leading: const CircleAvatar(
              child: Text("A"),
            ),
            title: const Text(
              "Expand Card",
            ),
            subtitle: const Text("Subtile"),
            children: const <Widget>[
              Divider(thickness: 1.0),
              Text("Day 05"),
              Text("Day 05"),
              Text("Day 05"),
            ],
          ),
        ],
      ),
    );
  }
}
