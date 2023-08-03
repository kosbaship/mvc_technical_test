import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_technical_test/common/extension/extension.dart';
import 'package:ossos_technical_test/common/widgets/osson_text.dart';
import 'package:ossos_technical_test/features/first/view/widgets/small_shape.dart';

import '../../../common/dp/dp.dart';
import '../../../common/enum/annimation_type.dart';
import '../controller/animation_cubit.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key, required this.name}) : super(key: key);
  static String routeName = 'firstPage';
  final String? name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AnimationCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const OSText("Animation"),
          ),
          body: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: (name?.isNotEmpty ?? false)
                      ? Center(
                          child: OSText(
                          "Hi $name",
                          style: context.textTheme.displayMedium?.copyWith(fontSize: 24.sp),
                        ))
                      : const SizedBox.shrink()),
              Expanded(
                flex: 3,
                child: Center(
                  child: BlocBuilder<AnimationCubit, AnimationState>(
                    builder: (context, state) {
                      return AnimatedContainer(
                        key: Key("BigShape"),
                        height: 250.r,
                        curve: Curves.decelerate,
                        width: 250.r,
                        decoration: BoxDecoration(
                            color: state.getSelectAnimation.color,
                            // shape: type.shape,
                            borderRadius: BorderRadius.circular(state.getSelectAnimation.radius.r)),
                        duration: const Duration(seconds: 1),
                      );
                    },
                  ),
                ),
              ),
              const Spacer(flex: 2),
              BlocBuilder<AnimationCubit, AnimationState>(
                builder: (context, state) {
                  return Padding(
                    padding: REdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        SmallShapeWidget(
                            alignment: state.list[0].alignment,
                            onTap: () {
                              context.read<AnimationCubit>().changeAnimation(AnimationType.withoutDecoration);
                            },
                            animationType: AnimationType.withoutDecoration),
                        SmallShapeWidget(
                            alignment: state.list[1].alignment,
                            onTap: () {
                              context.read<AnimationCubit>().changeAnimation(AnimationType.withBorderRadius);
                            },
                            animationType: AnimationType.withBorderRadius),
                        SmallShapeWidget(
                            alignment: state.list[2].alignment,
                            onTap: () {
                              context.read<AnimationCubit>().changeAnimation(AnimationType.circleShape);
                            },
                            animationType: AnimationType.circleShape),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
