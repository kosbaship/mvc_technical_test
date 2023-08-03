import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ossos_technical_test/common/config_size.dart';
import 'package:ossos_technical_test/features/second/view/widgets/pokemon_card.dart';

import '../../../common/dp/dp.dart';
import '../../../common/widgets/osson_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/pokemon_bloc.dart';
import '../model/pokemon.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static String routeName = 'secondPage';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late final PokemonBloc pokemonBloc;

  @override
  void initState() {
    pokemonBloc = getIt<PokemonBloc>();
    pokemonBloc.state.pagingController.addPageRequestListener((pageKey) {
      pokemonBloc.add(FetchedPokemon(pageKey));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: pokemonBloc,
      child: Scaffold(
        appBar: AppBar(title: const OSText("Pokemons")),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            return Center(
              child: PagedListView<int, Pokemon>(
                padding: REdgeInsets.all(OSSize.kPage),
                pagingController: state.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Pokemon>(

                  itemBuilder: (context, item, index) => PokemonCard(item: item),
                ),
              ),
            );

          },
        ),
      ),
    );
  }
}

