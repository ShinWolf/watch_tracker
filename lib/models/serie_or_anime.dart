import 'package:watch_tracker/models/enums/types_enum.dart';
import 'package:watch_tracker/models/tracked_item.dart';

class SerieOrAnime extends TrackedItem {
  late int _currentEpisode;
  late int _currentSeason;
  late int _totalSeason;
  late int _totalEpisode;
  late TypesEnum _type;

  SerieOrAnime(super.image, super.name, super.status, this._currentEpisode,
      this._currentSeason, this._totalEpisode, this._totalSeason, this._type);

  int getCurrentEpisode() {
    return _currentEpisode;
  }

  setCurrentEpisode(int currentSeason) {
    _currentSeason = currentSeason;
  }

  int getCurrentSeason() {
    return _currentSeason;
  }

  setCurrentSeason(int currentSeason) {
    _currentSeason = currentSeason;
  }

  int getTotalEpisode() {
    return _totalEpisode;
  }

  setTotalEpisode(int totalEpisode) {
    _totalEpisode = totalEpisode;
  }

  int getTotalSeason() {
    return _totalSeason;
  }

  setTotalSeason(int totalSeason) {
    _totalSeason = totalSeason;
  }

  TypesEnum getType() {
    return _type;
  }

  setType(TypesEnum type) {
    _type = type;
  }
}
