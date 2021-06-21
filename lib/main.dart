import 'package:app_pokedex/model/repoistory/pokemon_repository.dart';
import 'package:app_pokedex/presenter/home_controller.dart';
import 'package:app_pokedex/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => PokemonRepository()),
      ],
      child: ChangeNotifierProvider(
        create: (_) => HomeController(_.read()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
