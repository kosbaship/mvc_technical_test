part of 'animation_cubit.dart';

class AnimationState extends Equatable  {
  final List<AnimationWithAlignment> list;

  AnimationState({List<AnimationWithAlignment>? list})
      : list = list ??
            [
              AnimationWithAlignment(animationType: AnimationType.withoutDecoration, alignment: Alignment.centerLeft),
              AnimationWithAlignment(animationType: AnimationType.withBorderRadius, alignment: Alignment.center),
              AnimationWithAlignment(animationType: AnimationType.circleShape, alignment: Alignment.centerRight),
            ];

  AnimationState copyWith({
    List<AnimationWithAlignment>? list,
  }) =>
      AnimationState(list: list ?? this.list);

  AnimationType get getSelectAnimation =>
      list.firstWhere((element) => element.alignment == Alignment.center).animationType;

  @override
  String toString() {
    return list.toString();
  }

  @override
  List<Object?> get props => [list];

}
