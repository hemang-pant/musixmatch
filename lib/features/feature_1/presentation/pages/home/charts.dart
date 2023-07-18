import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_chart_bloc.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_chart_state.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: appBar(),
    );
  }

  appBar() {
    return AppBar(
      title: const Text('Charts'),
    );
  }

  buildBody() {
    return BlocBuilder<RemoteChartBloc, RemoteChartState>(builder: (_, state) {
      if (state is RemoteChartLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is RemoteChartSuccess) {
        return ListView.builder(
          itemCount: state.tracks!.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(state.tracks![index].name?? ''),
                subtitle: Text(state.tracks![index].artistName?? ''),
                leading: const Icon(
                  Icons.music_note,
                  color: Colors.blue,
                ),
              ),
            );
          }
        );
      }
      if (state is RemoteChartFailed) {
        return Center(child: Text(state.error!.toString()));
      }
      return const SizedBox();
    });
  }
}
