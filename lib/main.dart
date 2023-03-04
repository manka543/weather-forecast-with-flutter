import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/bloc/details_bloc/details_bloc.dart';
import 'package:weather_forecast/bloc/home_bloc/home_bloc.dart';
import 'package:weather_forecast/bloc/search_bloc/search_bloc.dart';

import 'views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
        BlocProvider<DetailsBloc>(
          create: (context) => DetailsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather forecast',
        theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.teal),
        home: const HomeView(),
      ),
    );
  }
}
