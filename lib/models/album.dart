class Album {
  String _title;
  String _artist;
  String _url;
  String _image;
  String _thumbnailImage;

  String get title => _title;
  String get artist => _artist;
  String get url => _url;
  String get image => _image;
  String get thumbnailImage => _thumbnailImage;

  Album(this._title, this._artist, this._url, this._image, this._thumbnailImage);
}