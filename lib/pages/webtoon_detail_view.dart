import 'package:flutter/material.dart';
import '../models/webtoon.dart';

class WebtoonDetailView extends StatelessWidget {
  final Webtoon webtoon;

  WebtoonDetailView({required this.webtoon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(webtoon.getName()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (webtoon.getImage() != null)
              Image.asset(webtoon.getImage()!, fit: BoxFit.cover)
            else
              const Icon(Icons.image_not_supported,
                  size: 100, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Name: ${webtoon.getName()}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Chapter: ${webtoon.getCurrentChapter()} / ${webtoon.getTotalChapter()}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${webtoon.getStatus().toString().split('.').last}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
