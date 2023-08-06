import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/domain/character/character.dart';
import 'package:rick_and_morty/provider/api_provider.dart';

final characterDataProvider = FutureProvider.autoDispose<List<CharacterModel>>(
  (ref) {
    return ref.read(apiProvider).getCharactersDatas().then(
      (characters) {
        final List<CharacterModel> characterList = [];
        for (var i = 0; i < 20; i++) {
          characterList.add(
            CharacterModel(
              characterName: characters[i]["name"],
              characterImgUrl: characters[i]["image"],
            ),
          );
        }
        return characterList;
      },
    );
  },
);
