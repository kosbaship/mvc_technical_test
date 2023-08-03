import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_technical_test/common/config_size.dart';
import 'package:ossos_technical_test/router/router.dart';

import 'common/dp/dp.dart';

void main()  {
 dependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: OSSize.designSize,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Ossos',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: router,
          );
        });
  }
}
