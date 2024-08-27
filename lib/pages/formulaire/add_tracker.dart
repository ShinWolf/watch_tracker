import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:watch_tracker/models/enums/types_enum.dart';
import 'package:watch_tracker/pages/formulaire/add_champ_serie_or_anime.dart';

import '../../models/enums/status.dart';

class AddTracker extends StatefulWidget {
  @override
  _AddTrackerState createState() => _AddTrackerState();
}

class _AddTrackerState extends State<AddTracker> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  Status? _selectedStatus;
  TypesEnum? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Watch Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Pick your image",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pick your image';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "Enter a name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<Status>(
                decoration: const InputDecoration(labelText: 'Status'),
                value: _selectedStatus,
                onChanged: (Status? newValue) {
                  setState(() {
                    _selectedStatus = newValue!;
                  });
                },
                items: Status.values.map((Status status) {
                  return DropdownMenuItem<Status>(
                    value: status,
                    child: Text(status.toString().split('.').last),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Please select a status' : null,
              ),
              DropdownButtonFormField<TypesEnum>(
                decoration: const InputDecoration(labelText: 'Types'),
                value: _selectedType,
                onChanged: (TypesEnum? newValue) {
                  setState(() {
                    _selectedType = newValue!;
                  });
                },
                items: TypesEnum.values.map((TypesEnum types) {
                  return DropdownMenuItem<TypesEnum>(
                    value: types,
                    child: Text(types.toString().split('.').last),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Please select a status' : null,
              ),
              if (_selectedType == TypesEnum.anime ||
                  _selectedType == TypesEnum.series) ...[
                const AddChampSerieOrAnime()
              ] else if (_selectedType == TypesEnum.webtoon)
                ...[]
            ],
          ),
        ),
      ),
    );
  }
}
