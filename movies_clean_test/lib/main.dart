import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_test/injector_container.dart';
import 'package:movies_clean_test/view/blocs/get_movies_cubit/get_movies_cubit.dart';
import 'package:movies_clean_test/view/pages/home_page.dart';
import 'package:movies_clean_test/injector_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => sl<GetMoviesCubit>(),
        child: const HomePage(),
      )
    );
  }
}