class Calls {
  String _image;
  String _title;
  String _subTitle;

  Calls(this._image, this._title, this._subTitle);

  String get subTitle => _subTitle;

  set subTitle(String value) {
    this._subTitle = value;
  }

  String get title => _title;

  set title(String value) {
    this._title = value;
  }

  String get image => _image;

  set image(String value) {
    this._image = value;
  }
}
