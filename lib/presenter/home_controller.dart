import 'package:app_pokedex/model/pokemon.dart';
import 'package:app_pokedex/model/pokemon_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final PokemonRepository _repository;

  HomeController(this._repository);

  List<Pokemon> pokemonList = [];
  bool loading = false;
  int _page = 0;

  void loadPokemon({bool isMore = false}) {
    loading = true;
    notifyListeners();
    if (isMore) {
      _page++;
    }
    _repository.load(_page).then((value) {
      if (isMore) {
        pokemonList.addAll(value);
      } else {
        pokemonList = value;
      }
      loading = false;
      notifyListeners();
    });
  }
}
