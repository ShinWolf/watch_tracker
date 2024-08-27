import 'package:flutter/material.dart';

class AddChampSerieOrAnime extends StatefulWidget {
  const AddChampSerieOrAnime({super.key});

  @override
  State<AddChampSerieOrAnime> createState() => _AddChampSerieOrAnimeState();
}

class _AddChampSerieOrAnimeState extends State<AddChampSerieOrAnime> {
  final TextEditingController _currentEpisodeController =
      TextEditingController();
  final TextEditingController _totalEpisodeController = TextEditingController();
  final TextEditingController _currentSeasonController =
      TextEditingController();
  final TextEditingController _totalSeasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextFormField(
            controller: _currentEpisodeController,
            decoration: const InputDecoration(
              hintText: "Enter current episode",
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _currentSeasonController,
            decoration: const InputDecoration(
              hintText: "Enter a current season",
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalEpisodeController,
            decoration: const InputDecoration(
              hintText: "Enter total episode",
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalSeasonController,
            decoration: const InputDecoration(
              hintText: "Enter a total season",
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some number';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
