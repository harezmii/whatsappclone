class Status {
  String _image;
  String _caption;
  String _date;

  Status(this._image, this._caption, this._date);

  String get date => _date;

  set date(String value) {
    this._date = value;
  }

  String get caption => _caption;

  set caption(String value) {
    this._caption = value;
  }

  String get image => _image;

  set image(String value) {
    this._image = value;
  }
}
