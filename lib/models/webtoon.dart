import 'package:watch_tracker/models/tracked_item.dart';

class Webtoon extends TrackedItem {
  int _currentChapter;
  int _totalChapter;

  Webtoon(super.image, super.name, super.status, this._currentChapter,
      this._totalChapter);

  int getCurrentChapter() {
    return _currentChapter;
  }

  setCurrentChapter(int currentChapter) {
    _currentChapter = currentChapter;
  }

  int getTotalChapter() {
    return _totalChapter;
  }

  setTotalChapter(int totalChapter) {
    _totalChapter = totalChapter;
  }
}
