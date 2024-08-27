import 'package:flutter/material.dart';
import '../models/serie_or_anime.dart';

class SerieOrAnimeDetailView extends StatelessWidget {
  final SerieOrAnime serieOrAnime;

  SerieOrAnimeDetailView({required this.serieOrAnime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serieOrAnime.getName()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: serieOrAnime.getImage() != null
                      ? Image.asset(serieOrAnime.getImage()!, fit: BoxFit.cover)
                      : const Icon(Icons.image_not_supported,
                          size: 100, color: Colors.grey),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    serieOrAnime.getName(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Season: ${serieOrAnime.getCurrentSeason()} / ${serieOrAnime.getTotalSeason()}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Episode: ${serieOrAnime.getCurrentEpisode()} / ${serieOrAnime.getTotalEpisode()}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Some brief description about the movie. This could be a plot summary or any other relevant information.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.check),
                      label: const Text('Compléter'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        // Mark as completed logic
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.update),
                      label: const Text('Modifer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        // Add to list logic
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
