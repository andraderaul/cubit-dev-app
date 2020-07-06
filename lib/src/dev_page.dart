import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

import 'dev_cubit.dart';
import 'dev_state.dart';

class DevPage extends StatefulWidget {
  @override
  _DevPageState createState() => _DevPageState();
}

class _DevPageState extends State<DevPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Dev'),
      ),
      body: CubitBuilder<DevCubit, DevState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final dev = state.dev;
            return Card(
              child: ListTile(
                title: Text(dev.name),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(dev.avatarUrl),
                ),
              ),
            );
          } else {
            return Center(
              child: Text('Algo deu errado'),
            );
          }
        },
      ),
    );
  }
}
