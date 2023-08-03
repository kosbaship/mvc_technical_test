import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ossos_technical_test/common/config_size.dart';
import 'package:ossos_technical_test/common/extension/extension.dart';
import 'package:ossos_technical_test/common/widgets/ossos_text_button.dart';

import '../../../common/dp/dp.dart';
import '../../../common/widgets/osson_text.dart';
import '../../../common/widgets/ossos_filled_button.dart';
import '../../../common/widgets/ossos_text_field.dart';
import '../../first/view/first_screen.dart';
import '../../second/view/second_screen.dart';
import '../controller/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const OSText("Home"),
          ),
          bottomNavigationBar: RPadding(
            padding: REdgeInsets.all(OSSize.kPage),
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              OSTextButton(
                  onPressed: () {
                    context.read<HomeCubit>().changeText(null);
                  },
                  icon: const Icon(Icons.delete_forever),
                  label: const Text("Clear Text"),
                  style: TextButton.styleFrom(foregroundColor: context.colorScheme.error)),
              10.verticalSpace,
              OSFilledButton(
                  onPressed: () {
                    context.goNamed(FirstScreen.routeName, queryParameters: {"name": context.read<HomeCubit>().state});
                  },
                  child: const Text('Animation Page')),
              10.verticalSpace,
              OSFilledButton(
                  onPressed: () {
                    context.goNamed(SecondScreen.routeName);
                  },
                  child: const Text('Pokemon Page')),
            ]),
          ),
          body: RPadding(
            padding: REdgeInsets.symmetric(horizontal: OSSize.kPage),
            child: Column(
              children: [
                BlocBuilder<HomeCubit, String>(
                  builder: (context, state) {
                    return OSTextField(
                      controller: context.read<HomeCubit>().textEditingController,
                      hintText: "Write anything",
                      onChanged: (text) {
                        context.read<HomeCubit>().changeText(text);
                      },
                    );
                  },
                ),
                20.verticalSpace,
                BlocBuilder<HomeCubit, String>(
                  builder: (context, state) {
                    return OSText(
                      (state.isEmpty) ? "You have not entered name yet" : state,
                      style: context.textTheme.bodySmall,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
