import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ossos_technical_test/common/network/exceptions/exceptions.dart';
import 'package:ossos_technical_test/common/network/http_client.dart';
import 'package:ossos_technical_test/common/network/result.dart';
import 'package:ossos_technical_test/common/network/route.dart';

import '../../../common/network/page_state/page_state.dart';
import '../model/pokemon_results.dart';
import '../model/pokemon.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final DioClient dio;
  static const _pageSize = 20;

  PokemonBloc(this.dio) : super(PokemonState()) {
    on<FetchedPokemon>((event, emit) async {
      final result = await fetchPokemon(event.pageKey);
      switch (result) {
        case Success(value: final data):
          final isLastPage = data.next == null;
          if (isLastPage) {
            state.pagingController.appendLastPage(data.results ?? []);
          } else {
            Uri uri = Uri.parse(data.next!);
            int offset = int.parse(uri.queryParameters['offset'] ?? "0");
            state.pagingController.appendPage(data.results ?? [], offset);
          }
        case Failure(exception: final _, message: final message):
          state.pagingController.error = message;
      }

      ///without pagination
      // emit(state.copyWith(pokemonStatus: const Loading()));
      // final result = await fetchPokemon(10, 0);
      // switch (result) {
      //   case Success(value: final data):
      //     emit(state.copyWith(pokemonStatus: Loaded(data)));
      //   case Failure(exception: final exception, message: final message):
      //     emit(state.copyWith(pokemonStatus: Error(exception: exception, message: message)));
      // }
    });
  }

  Future<Result<PokemonResults>> fetchPokemon(int offset) async {
    log("fetch Pokemon with offset $offset");
    try {
      final result = await dio.get("${OSURl.pokemon}?offset=$offset&limit=_$_pageSize", queryParameters: {});
      log(PokemonResults.fromJson(result.data).toString());
      return Success(PokemonResults.fromJson(result.data));
    } on AppException catch (e) {
      return Failure(e, message: "");
    } catch (e) {
      return Failure(AppException(message: e.toString(), exception: e), message: e.toString());
    }
  }
}
