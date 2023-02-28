// To parse this JSON data, do
//
//     final pokemonResponse = pokemonResponseFromJson(jsonString);

import 'dart:convert';

PokemonResponse pokemonResponseFromJson(String str) => PokemonResponse.fromJson(json.decode(str));

String pokemonResponseToJson(PokemonResponse data) => json.encode(data.toJson());

class PokemonResponse {
    PokemonResponse({
        required this.count,
        this.next,
        this.previous,
        required this.results,
    });

    int count;
    dynamic next;
    dynamic previous;
    List<Result> results;

    factory PokemonResponse.fromJson(Map<String, dynamic> json) => PokemonResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
