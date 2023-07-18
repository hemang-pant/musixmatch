import 'package:flutter/material.dart';
import 'package:musixmatch/features/feature_1/presentation/pages/home/charts.dart';

import 'injection_container.dart';

Future<void> main() async {
  await initializeDependecies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Charts(),
    );
  }
}
