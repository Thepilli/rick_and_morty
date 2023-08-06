import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/presentation/core/app_widget.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    ProviderScope(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return const MyApp();
        },
      ),
    ),
  );
}
