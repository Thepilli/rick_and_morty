import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/application/search/search_event.dart';
import 'package:rick_and_morty/constants/colors.dart';
import 'package:rick_and_morty/provider/search_provider.dart';

import 'package:sizer/sizer.dart';

class SearchedBar extends StatelessWidget {
  SearchedBar({Key? key}) : super(key: key);
  final textfieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 100.w,
      height: 5.h,
      decoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25),
            width: 70.w,
            height: 20.h,
            child: Center(
              child: TextField(
                controller: textfieldController,
                cursorColor: AppColors.whiteColor,
                style: const TextStyle(color: AppColors.whiteColor),
                decoration: const InputDecoration.collapsed(
                  hintText: 'searchCharactersText',
                  hintStyle: TextStyle(color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () {
                  if (textfieldController.text.isEmpty) {
                    ref.refresh(searchProvider);
                  } else {
                    ref.refresh(searchProvider);
                    ref.read(searchProvider.notifier).mapEventsToState(
                          SearchedTextChanged(
                            text: textfieldController.text,
                          ),
                        );
                  }
                },
                icon: const Icon(
                  Icons.search,
                  color: AppColors.whiteColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
