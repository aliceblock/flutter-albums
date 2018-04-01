import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import './album_detail.dart';
import '../models/album.dart';

class AlbumList extends StatefulWidget {
  @override
  _AlbumListState createState() => new _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  List<Album> _albums = [];
  
  _AlbumListState() {
    this.loadData();
  }

  void loadData() async {
    try {
      var url = 'http://rallycoding.herokuapp.com/api/music_albums';
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var jsonString = await response.transform(utf8.decoder).join();
        var data = json.decode(jsonString);
        var albums = [];
        for(var obj in data) {
          albums.add(new Album(obj['title'], obj['artist'], obj['url'], obj['image'], obj['thumbnail_image']));
        }
        this.setState(() {
          _albums = albums;
        });
      } else {
        print('Http status ${response.statusCode}');
      }
    } catch(exception) {
      print('Request Failed!');
      print(exception.toString());
    }
  }

  List<AlbumDetail> generateAlbumDetail() {
    List<AlbumDetail> albumDetails = [];
    for(var album in this._albums) {
      albumDetails.add(new AlbumDetail(album));
    }
    return albumDetails;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.only(bottom: 10.0),
        children: this.generateAlbumDetail(),
      ),
    );
  }
}