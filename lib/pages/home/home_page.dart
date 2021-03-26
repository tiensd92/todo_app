import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeBloc>(
        create: (_) => HomeBloc(HomeState(listTask: [], date: DateTime.now())),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
