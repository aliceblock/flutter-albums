import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/album.dart';
import './card_section.dart';

class AlbumDetail extends StatelessWidget {
  static const HEADER_HEIGHT = 75.0;
  Album _album;

  AlbumDetail(this._album);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(horizontal: 10.0) + new EdgeInsets.only(top: 10.0),
      child: new Material(
        borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
        color: Colors.white,
        elevation: 2.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            new CardSection(new Row(
              children: [
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  child: new Image.network(this._album.thumbnailImage,
                    width: HEADER_HEIGHT,
                  ),
                ),
                new Container(
                  height: HEADER_HEIGHT,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Container(
                        child: new Text(this._album.title,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 24.0
                          )
                        ),
                      ),
                      new Container(
                        child: new Text(this._album.artist,
                          style: new TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
            new CardSection(new Image.network(this._album.image, fit: BoxFit.fitWidth,)),
            new CardSection(new RaisedButton(
              color: Colors.blueAccent,
              elevation: 2.0,
              child: new Text("Buy Now", style: new TextStyle(color: Colors.white, fontSize: 18.0)),
              onPressed: () {
                _launchURL(this._album.url);
              },
            ), false),
          ],
        ),
      ),
    );
  }
}