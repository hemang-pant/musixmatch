import 'package:flutter/material.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Charts')),
      appBar: appBar(),
    );
  }
  appBar(){
    return AppBar(
      title: const Text('Charts'),
    );
  }
}
