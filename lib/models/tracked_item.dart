import 'package:watch_tracker/models/enums/status.dart';

abstract class TrackedItem {
  String? _image;
  String _name;
  Status _status;
  DateTime _createdDate;
  DateTime? _lastModif;

  TrackedItem(this._image, this._name, this._status)
      : _createdDate = DateTime.now();

  String? getImage() {
    return _image;
  }

  setImage(String image) {
    _image = image;
  }

  String getName() {
    return _name;
  }

  setName(String name) {
    _name = name;
  }

  Status getStatus() {
    return _status;
  }

  setStatus(Status status) {
    _status = status;
  }

  DateTime getCreatedDate() {
    return _createdDate;
  }

  setCreatedDate(DateTime createdDate) {
    _createdDate = createdDate;
  }

  DateTime? getLastModif() {
    return _lastModif;
  }

  setLastmodif() {
    _lastModif = DateTime.now();
  }
}
