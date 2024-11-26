import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/widgets/components/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:  SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTopBar(),
              ],
            )
          ),
      ),
    );
  }
}