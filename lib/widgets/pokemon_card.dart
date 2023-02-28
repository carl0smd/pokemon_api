
import 'package:flutter/material.dart';
import 'package:pokemon_api/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatelessWidget {

  final String name;

  const PokemonCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {

    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return FutureBuilder(
      future: pokemonProvider.getPokemonData(name),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                Image.network(snapshot.data.sprites.frontDefault ?? '', height: 100),
                Expanded(
                  child: Text(
                    "${snapshot.data.name[0].toUpperCase()}${snapshot.data.name.substring(1).toLowerCase()}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '#${snapshot.data.id}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    
                  ),

                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}