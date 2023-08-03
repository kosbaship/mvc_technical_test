
import 'pokemon.dart';

class PokemonResults {
  final   int? count;
  final   String? next;
  final   String? previous;
  final   List<Pokemon>? results;

    PokemonResults({this.count, this.next, this.previous, this.results});

    factory PokemonResults.fromJson(Map<String, dynamic> json) {
        return PokemonResults(
            count: json['count'], 
            next: json['next'], 
            previous: json['previous'], 
            results: json['results'] != null ? ((json['results'] as List).map((i) => Pokemon.fromJson(i)).toList()) : [],
        );
    }


}