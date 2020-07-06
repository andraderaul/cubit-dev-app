import 'package:dev_app/src/dev_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:dio/dio.dart';

import 'package:dev_app/src/dev_cubit.dart';
import 'package:dev_app/src/dev_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CubitProvider<DevCubit>(
        create: (context) => DevCubit(
          repository: DevRepository(
            Dio(),
          ),
        ),
        child: DevPage(),
      ),
    );
  }
}
