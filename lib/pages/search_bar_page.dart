import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toolkit_app/components/note_widget.dart';

import '../components/note_functions.dart';
import '../components/custom_search_bar.dart';
import '../models/note_model.dart';
import '../provider/note_database.dart';
import '../provider/search_provider.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({super.key});

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  @override
  void initState() {
    super.initState();
    NoteFunctions.readNotes(context);
  }

  final NoteDatabase noteDatabase = NoteDatabase();

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Consumer<SearchProvider>(
      builder: (BuildContext context, SearchProvider value, Widget? child) {
        final searchController = TextEditingController(text: value.searchTerm);

        return Scaffold(
          appBar: AppBar(
            title: CustomSearchBar(
              controller: searchController,
              onChanged: (inputValue) {
                value.updateSearchTerm(inputValue);
              },
              suffixIcon: value.searchTerm.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () => value.updateSearchTerm(''),
                      icon: const Icon(Icons.close),
                    ),
            ),
          ),
          body: ListView.builder(
            itemCount: currentNotes.length,
            itemBuilder: (context, index) {
              final item = currentNotes[index].text;

              if (value.searchTerm.isEmpty ||
                  item.toLowerCase().contains(value.searchTerm.toLowerCase())) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: NoteWidget(
                    text: item,
                    onPressedEdit: () {},
                    onPressedDelete: () {},
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        );
      },
    );
  }

  searchBar(searchController, onChanged) {
    return CupertinoSearchTextField(
      controller: searchController,
      placeholder: 'بحث...',
      autofocus: true,
      onChanged: onChanged,
    );
  }
}
