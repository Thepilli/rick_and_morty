import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/domain/character/character.dart';
import 'package:rick_and_morty/provider/search_provider.dart';
import 'package:sizer/sizer.dart';

class RickAndMortyTiles extends ConsumerWidget {
  const RickAndMortyTiles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CharacterModel> characterList = ref.watch(searchProvider).characterList;

    return characterList.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150, left: 8, right: 8),
              child: Text(
                'noCharacter',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : SizedBox(
            width: 100.w,
            height: 60.h,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: characterList.length,
              itemBuilder: (context, int index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  width: 20.w,
                  height: 20.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 18.h,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: characterList[index].characterImgUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          characterList[index].characterName,
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
