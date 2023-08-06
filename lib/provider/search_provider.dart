import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/application/search/search_event.dart';
import 'package:rick_and_morty/application/search/search_notifier.dart';
import 'package:rick_and_morty/application/search/search_state.dart';
import 'package:rick_and_morty/provider/character_data_provider.dart';

final searchProvider = StateNotifierProvider.autoDispose<SearchNotifier, SearchState>(
  (ref) {
    final characterModelList = ref.watch(characterDataProvider).whenOrNull(data: (data) => data);

    return SearchNotifier()
      ..mapEventsToState(
        UpdateListItems(
          characterModelList: characterModelList ?? [],
        ),
      );
  },
);
