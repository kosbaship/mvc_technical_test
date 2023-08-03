part of 'pokemon_bloc.dart';

class PokemonState {
  final PageState<PokemonResults> pokemonStatus;
  final PagingController<int, Pokemon> pagingController;

  PokemonState({ PagingController<int, Pokemon>? pagingController,this.pokemonStatus = const Initial()}):pagingController = PagingController(firstPageKey: 0);

  PokemonState copyWith({PageState<PokemonResults>? pokemonStatus}) => PokemonState(
        pokemonStatus: pokemonStatus ?? this.pokemonStatus,
      );
}
