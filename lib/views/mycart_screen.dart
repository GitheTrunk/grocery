import 'package:flutter/material.dart';

class MycartScreen extends StatelessWidget {
  const MycartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        shadowColor: ThemeData().shadowColor,
      ),
      body: const Center(child: Text('My Cart Screen')),
    );
  }
}
