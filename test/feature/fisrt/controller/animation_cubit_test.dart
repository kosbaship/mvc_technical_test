import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ossos_technical_test/common/enum/annimation_type.dart';
import 'package:ossos_technical_test/features/first/controller/animation_cubit.dart';
import 'package:ossos_technical_test/features/first/model/animation_with_alignment.dart';

main() {
  blocTest(
    "Initial State is WD BR C  , test move C to center ",
    build: () => AnimationCubit(AnimationState()),
    act: (bloc) {
      bloc.changeAnimation(AnimationType.circleShape);
    },
    expect: () => [
      isA<AnimationState>().having((p0) => p0.list, "description", [
        AnimationWithAlignment(animationType: AnimationType.withoutDecoration, alignment: Alignment.centerLeft),
        AnimationWithAlignment(animationType: AnimationType.withBorderRadius, alignment: Alignment.centerRight),
        AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.center),
      ])
    ],
  );
  blocTest(
    "Initial State is WD BR C  , test move WD to center ",
    build: () => AnimationCubit(AnimationState()),
    act: (bloc) {
      bloc.changeAnimation(AnimationType.withoutDecoration);
    },
    expect: () => [
      isA<AnimationState>().having((p0) => p0.list, "description", [
        AnimationWithAlignment(animationType: AnimationType.withoutDecoration, alignment: Alignment.center),
        AnimationWithAlignment(animationType: AnimationType.withBorderRadius, alignment: Alignment.centerLeft),
        AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.centerRight),
      ])
    ],
  );

  ///Seed State  WD C BR
  final seed1 = AnimationState(list: [
    AnimationWithAlignment(animationType: AnimationType.withoutDecoration, alignment: Alignment.centerLeft),
    AnimationWithAlignment(animationType: AnimationType.withBorderRadius, alignment: Alignment.centerRight),
    AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.center),
  ]);
  blocTest<AnimationCubit, AnimationState>(
    "Initial State is WD C BR  , test move WD to center ",
    build: () => AnimationCubit(AnimationState()),
    seed: () => seed1,
    act: (bloc) {
      bloc.changeAnimation(AnimationType.withoutDecoration);
    },
    expect: () => [
      isA<AnimationState>().having((p0) => p0.list, "description", [
        AnimationWithAlignment(animationType: AnimationType.withoutDecoration, alignment: Alignment.center),
        AnimationWithAlignment(animationType: AnimationType.withBorderRadius, alignment: Alignment.centerRight),
        AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.centerLeft),
      ])
    ],
  );

  ///Move Of Test
  ///WD   WB    C
  ///WD   C     WB
  ///WD   WB    C
  ///WB   WD    C
  ///WB   C     WD
  ///WB   WD    C
  ///WD   WB    C
  ///End
  blocTest("",
      build: () => AnimationCubit(AnimationState()),
      act: (bloc) {
        bloc.changeAnimation(AnimationType.circleShape);

        ///will not emit any thing
        bloc.changeAnimation(AnimationType.circleShape);
        bloc.changeAnimation(AnimationType.withBorderRadius);
        bloc.changeAnimation(AnimationType.withBorderRadius);
        bloc.changeAnimation(AnimationType.withoutDecoration);
        bloc.changeAnimation(AnimationType.withoutDecoration);
        bloc.changeAnimation(AnimationType.withoutDecoration);
        bloc.changeAnimation(AnimationType.circleShape);
        bloc.changeAnimation(AnimationType.withoutDecoration);
        bloc.changeAnimation(AnimationType.withBorderRadius);
      },
      expect: () => [
            isA<AnimationState>().having((p0) => p0.list, "description", [
              AnimationWithAlignment(animationType: AnimationType.withoutDecoration, alignment: Alignment.centerLeft),
              AnimationWithAlignment(animationType: AnimationType.withBorderRadius, alignment: Alignment.centerRight),
              AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.center),
            ]),
            isA<AnimationState>().having(
                (p0) => p0.list,
                "saas",
                List.of([
                  AnimationWithAlignment(
                      animationType: AnimationType.withoutDecoration, alignment: Alignment.centerLeft),
                  AnimationWithAlignment(animationType: AnimationType.withBorderRadius, alignment: Alignment.center),
                  AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.centerRight),
                ])),
            isA<AnimationState>().having(
                (p0) => p0.list,
                "saas",
                List.of([
                  AnimationWithAlignment(animationType: AnimationType.withoutDecoration, alignment: Alignment.center),
                  AnimationWithAlignment(
                      animationType: AnimationType.withBorderRadius, alignment: Alignment.centerLeft),
                  AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.centerRight),
                ])),
            isA<AnimationState>().having(
                (p0) => p0.list,
                "saas",
                List.of([
                  AnimationWithAlignment(
                      animationType: AnimationType.withoutDecoration, alignment: Alignment.centerRight),
                  AnimationWithAlignment(
                      animationType: AnimationType.withBorderRadius, alignment: Alignment.centerLeft),
                  AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.center),
                ])),
            isA<AnimationState>().having(
                (p0) => p0.list,
                "saas",
                List.of([
                  AnimationWithAlignment(animationType: AnimationType.withoutDecoration, alignment: Alignment.center),
                  AnimationWithAlignment(
                      animationType: AnimationType.withBorderRadius, alignment: Alignment.centerLeft),
                  AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.centerRight),
                ])),
            isA<AnimationState>().having(
                (p0) => p0.list,
                "saas",
                List.of([
                  AnimationWithAlignment(
                      animationType: AnimationType.withoutDecoration, alignment: Alignment.centerLeft),
                  AnimationWithAlignment(animationType: AnimationType.withBorderRadius, alignment: Alignment.center),
                  AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.centerRight),
                ])),
          ]);
}
