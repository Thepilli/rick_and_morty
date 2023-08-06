import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/colors.dart';

import 'presentation/pages/home_page/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.multiply,
            color: AppColors.grey,
          ),
          titlePadding: const EdgeInsets.only(bottom: 8),
        ),
      ),
      body: const HomePageBody(),
    );
  }
}
