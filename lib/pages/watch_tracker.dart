import 'package:flutter/material.dart';
import 'package:watch_tracker/pages/formulaire/add_tracker.dart';

import '../models/enums/status.dart';
import '../models/enums/types_enum.dart';
import '../models/movie.dart';
import '../models/serie_or_anime.dart';
import '../models/tracked_item.dart';
import '../models/webtoon.dart';
import 'movie_detail_view.dart';
import 'serie_or_anime_detail_view.dart';
import 'webtoon_detail_view.dart';

class WatchTracker extends StatefulWidget {
  const WatchTracker({super.key});

  @override
  State<WatchTracker> createState() => _WatchTrackerState();
}

class _WatchTrackerState extends State<WatchTracker> {
  int _selectedIndex = 0;

  final List<TrackedItem> items = [
    Movie(
      null,
      "Inception",
      Status.completed,
      "148 min",
      null,
    ),
    Movie(
      null,
      "The Matrix",
      Status.inProgress,
      "136 min",
      null,
    ),
    SerieOrAnime(
      null,
      "Breaking Bad",
      Status.completed,
      14,
      5,
      62,
      5,
      TypesEnum.series,
    ),
    SerieOrAnime(
      null,
      "Naruto",
      Status.inProgress,
      2,
      1,
      220,
      9,
      TypesEnum.anime,
    ),
    Webtoon(
      null,
      "Lore Olympus",
      Status.completed,
      150,
      150,
    ),
    Webtoon(
      null,
      "Let's Play",
      Status.inProgress,
      80,
      100,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildItemList(BuildContext context, TypesEnum type) {
    List<TrackedItem> filteredItems = items.where((item) {
      if (item is SerieOrAnime) {
        return item.getType() == type;
      } else if (item is Movie && type == TypesEnum.movie) {
        return true;
      } else if (item is Webtoon && type == TypesEnum.webtoon) {
        return true;
      }
      return false;
    }).toList();

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        TrackedItem item = filteredItems[index];
        return Card(
          child: ListTile(
            leading: item.getImage() != null
                ? Image.asset(item.getImage()!, fit: BoxFit.cover, width: 50)
                : const Icon(Icons.image_not_supported,
                    size: 50, color: Colors.grey),
            title: Text(item.getName()),
            subtitle: _buildSubtitle(item),
            trailing: getStatusBadge(item.getStatus()),
            onTap: () {
              navigateToDetailPage(context, item);
            },
          ),
        );
      },
    );
  }

  Widget _buildSubtitle(TrackedItem item) {
    if (item is Movie) {
      return Text('Duration: ${item.getDuration()}');
    } else if (item is SerieOrAnime) {
      return Text(
          'Season ${item.getCurrentSeason()}, Episode ${item.getCurrentEpisode()} / ${item.getTotalEpisode()}');
    } else if (item is Webtoon) {
      return Text(
          'Chapter ${item.getCurrentChapter()} / ${item.getTotalChapter()}');
    }
    return const Text('No details available');
  }

  Widget getStatusBadge(Status status) {
    String text;
    Color color;
    switch (status) {
      case Status.inProgress:
        text = "In Progress";
        color = Colors.blue;
        break;
      case Status.completed:
        text = "Completed";
        color = Colors.green;
        break;
      case Status.onHold:
        text = "On Hold";
        color = Colors.orange;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  List<Widget> _widgetOptions(BuildContext context) => [
        buildItemList(context, TypesEnum.series),
        buildItemList(context, TypesEnum.movie),
        buildItemList(context, TypesEnum.anime),
        buildItemList(context, TypesEnum.webtoon),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WatchTracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTracker()),
              );
            },
          )
        ],
      ),
      body: _widgetOptions(context)[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Series',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation),
            label: 'Anime',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Webtoon',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

void navigateToDetailPage(BuildContext context, TrackedItem item) {
  Widget detailPage;

  if (item is Movie) {
    detailPage = MovieDetailView(movie: item);
  } else if (item is SerieOrAnime) {
    detailPage = SerieOrAnimeDetailView(serieOrAnime: item);
  } else if (item is Webtoon) {
    detailPage = WebtoonDetailView(webtoon: item);
  } else {
    throw Exception('Unknown item type');
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => detailPage,
    ),
  );
}
