import 'package:app_pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailPage({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImag(),
                SizedBox(
                  height: 20,
                ),
                Text(pokemon.description ?? ''),
                ..._buildTypes(),
                ..._buildWeakness(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImag() {
    return Container(
      width: double.maxFinite,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Center(child: _buildImage()),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('#${pokemon.number}'),
          )
        ],
      ),
    );
  }

  List<Widget> _buildTypes() {
    return [
      SizedBox(
        height: 10,
      ),
      Divider(),
      SizedBox(
        height: 10,
      ),
      Text(
        'Tipo:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: pokemon.type.map<Widget>((e) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(e),
              );
            }).toList() ??
            [],
      ),
    ];
  }

  List<Widget> _buildWeakness() {
    return [
      SizedBox(
        height: 10,
      ),
      Divider(),
      SizedBox(
        height: 10,
      ),
      Text(
        'Fraquezas:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: pokemon.weakness.map<Widget>((e) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(e),
              );
            }).toList() ??
            [],
      ),
    ];
  }

  Widget _buildImage() {
    if (pokemon.thumbnailImage != null) {
      return Image.network(
        pokemon.thumbnailImage,
      );
    } else {
      return SizedBox();
    }
  }
}
