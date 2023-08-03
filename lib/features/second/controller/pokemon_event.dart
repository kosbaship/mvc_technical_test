part of 'pokemon_bloc.dart';

abstract class PokemonEvent {}
class FetchedPokemon extends PokemonEvent {
  final int pageKey ;

  FetchedPokemon(this.pageKey);
}