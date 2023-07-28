import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_monster/core/config/app_theme.dart';
import 'package:funny_monster/features/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:funny_monster/features/presentation/pages/splasch/splasch_page.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<TriviaBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Funny Monster',
        theme: darkAppTheme,
        home: const SplashPage(),
      ),
    );
  }
}
