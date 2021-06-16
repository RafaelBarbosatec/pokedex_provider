import 'package:app_pokedex/model/pokemon.dart';
import 'package:app_pokedex/presenter/home_controller.dart';
import 'package:app_pokedex/view/detail/detail.dart';
import 'package:app_pokedex/view/home/widgets/pokemon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    context.read<HomeController>().loadPokemon();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Consumer<HomeController>(
        builder: (_, controler, child) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: controler.pokemonList.length,
                itemBuilder: (context, index) {
                  if (index >= controler.pokemonList.length - 2) {
                    context.read<HomeController>().loadPokemon(isMore: true);
                  }
                  return PokemonWidget(
                    item: controler.pokemonList[index],
                    onTap: () => _goToDetail(controler.pokemonList[index]),
                  );
                },
              ),
              if (controler.loading) Center(child: CircularProgressIndicator()),
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
