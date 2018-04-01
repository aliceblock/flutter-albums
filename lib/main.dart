import 'package:flutter/material.dart';
import './components/album_list.dart';

main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Albums",
          style: new TextStyle(
            color: Colors.black,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      ),
      body: new AlbumList(),
    )
  ));
}