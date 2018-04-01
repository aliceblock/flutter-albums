import 'package:flutter/material.dart';

class CardSection extends StatelessWidget {

  Widget _section;
  bool _bottomBorder;

  CardSection(this._section, [this._bottomBorder = true]);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        border: (this._bottomBorder? new Border(bottom: new BorderSide(width: 1.0, color: Colors.black12)): new Border())
      ),
      child: _section,
    );
  }
}