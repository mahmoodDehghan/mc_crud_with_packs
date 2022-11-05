import 'package:example/widget/organizer/home_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'routeName';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeContainer(),
    );
  }
}
