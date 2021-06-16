import 'dart:convert';

import 'package:app_pokedex/model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  Future<List<Pokemon>> load(int page) async {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=20&page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = JsonDecoder().convert(response.body);
      return json['data'].map<Pokemon>((item) {
        return Pokemon.fromJson(item);
      }).toList();
    } else {
      return [];
    }
  }
}
