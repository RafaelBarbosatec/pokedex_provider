import 'package:app_pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonWidget extends StatelessWidget {
  final Pokemon item;
  final VoidCallback onTap;

  const PokemonWidget({Key key, this.item, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(item.name),
        leading: Image.network(item.thumbnailImage),
        trailing: Text(
          '#${item.number}',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
