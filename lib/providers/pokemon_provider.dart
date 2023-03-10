
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_api/models/pokemon.dart';
import 'package:pokemon_api/models/pokemon_response.dart';



class PokemonProvider extends ChangeNotifier {

  final String _baseURL = 'https://pokeapi.co';

  String _count = '0';

  List<Result> pokemonResults = [];

  Map<String, Pokemon> pokemonData = {};

  PokemonProvider() {
    print('PokemonProvider inicializado');
    getPokemonNames();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.parse(_baseURL + endpoint);
    final response = await http.get(url);
    return response.body;
  }

  getPokemonNames() async {
    final countInfo = await _getJsonData('/api/v2/pokemon');
    final countResponse = pokemonResponseFromJson(countInfo);
    _count = countResponse.count.toString();
    final data = await _getJsonData('/api/v2/pokemon?limit=$_count');
    final pokemonResponse = pokemonResponseFromJson(data);
    pokemonResults = pokemonResponse.results;
    
    notifyListeners();
  }

  Future<Pokemon> getPokemonData(String name) async {
    if (pokemonData.containsKey(name)) return pokemonData[name]!;
  
    final data = await _getJsonData('/api/v2/pokemon/$name');
    final pokemon = pokemonFromJson(data);
    pokemonData[name] = pokemon;
    return pokemon;
  }

}