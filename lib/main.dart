import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_chart_bloc.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_chart_event.dart';
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
    return BlocProvider<RemoteChartBloc>(
      create: (context) => sl()..add(
        const GetChart()
      ),
      child: const MaterialApp(
        home: Charts(),
      ),
    );
  }
}
