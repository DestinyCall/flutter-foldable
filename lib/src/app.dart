import 'package:flutter/material.dart';
import 'package:expn_app/src/expansion_widget/expansion_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Expansion Panel Demo';
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const ExpansionWidget(),
      ),
    );
  }
}