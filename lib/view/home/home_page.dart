import 'package:app_pokedex/model/pokemon.dart';
import 'package:app_pokedex/presenter/home_controller.dart';
import 'package:app_pokedex/shared/functions.dart';
import 'package:app_pokedex/view/detail/detail_page.dart';
import 'package:app_pokedex/view/home/widgets/pokemon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    postFrame(() {
      context.read<HomeController>().loadPokemon();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Consumer<HomeController>(
        builder: (_, controller, child) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: controller.pokemonList.length,
                itemBuilder: (context, index) {
                  if (index >= controller.pokemonList.length - 2) {
                    controller.loadPokemon(isMore: true);
                  }
                  return PokemonWidget(
                    item: controller.pokemonList[index],
                    onTap: () => _goToDetail(controller.pokemonList[index]),
                  );
                },
              ),
              if (controller.loading)
                Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }

  void _goToDetail(Pokemon pokemon) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailPage(
            pokemon: pokemon,
          );
        },
      ),
    );
  }
}
