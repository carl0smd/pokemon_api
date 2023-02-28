import 'package:flutter/material.dart';
import 'package:pokemon_api/providers/pokemon_provider.dart';
import 'package:pokemon_api/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon API'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: pokemonProvider.pokemonResults.length,
          itemBuilder: (BuildContext context, int index) {
            return PokemonCard(name: pokemonProvider.pokemonResults[index].name);
          },
        )
      ),
    ); 
  }
}