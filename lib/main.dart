import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:httpreq/homepage.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = 'https://jsonplaceholder.typicode.com/posts';

  var _postsjson = [];

  get $post => null;

  get _postjson => null;

  void fetchposts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsjson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchposts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ListView.builder(
            itemCount: _postsjson.length,
            itemBuilder: (context, i) {
              final post = _postjson[i];
              return Text("Title: ${$post['title']}");
            }),
      ),
    );
  }
}
