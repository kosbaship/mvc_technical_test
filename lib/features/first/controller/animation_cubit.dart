import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:ossos_technical_test/features/first/model/animation_with_alignment.dart';
import '../../../common/enum/annimation_type.dart';

part 'animation_state.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit(super.initialState);

  void changeAnimation(AnimationType type) {
    late Alignment oldAlignment;
    late int index;
    List<AnimationWithAlignment> list = state.list.mapIndexed((i, e) {
      if (e.animationType == type) {
        index = i;
        oldAlignment = e.alignment;
        return e.copyWith(alignment: Alignment.center);
      }
      return e;
    }).toList();
    if (oldAlignment == Alignment.center) return;
    list = list
        .mapIndexed((i, e) => e.alignment == Alignment.center && i != index ? e.copyWith(alignment: oldAlignment) : e)
        .toList();
    emit(state.copyWith(list: List.from(list)));
  }
}
