import 'package:get_it/get_it.dart';

import '../../features/first/controller/animation_cubit.dart';
import '../../features/home/controller/home_cubit.dart';
import '../../features/second/controller/pokemon_bloc.dart';
import '../network/http_client.dart';

GetIt getIt = GetIt.instance;

void dependencyInjection() {
  getIt.registerFactory<PokemonBloc>(() => PokemonBloc(DioClient()));
  getIt.registerFactory<AnimationCubit>(() => AnimationCubit(AnimationState()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(''));
}