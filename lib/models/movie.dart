import 'package:watch_tracker/models/tracked_item.dart';

class Movie extends TrackedItem {
  String _duration;
  List<Movie>? _listMovies;

  Movie(
      super.image, super.name, super.status, this._duration, this._listMovies);

  String getDuration() {
    return _duration;
  }

  setDuration(String duration) {
    _duration = duration;
  }

  List<Movie>? getListMovies() {
    return _listMovies;
  }

  setListMovies(List<Movie> listMovies) {
    _listMovies = listMovies;
  }
}
