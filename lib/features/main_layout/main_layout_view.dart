import 'package:flutter/material.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Main Layout View',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}