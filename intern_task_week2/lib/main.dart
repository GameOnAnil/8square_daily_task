import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task_week2/providers/locale_notifier.dart';
import 'package:intern_task_week2/utils/my_colors.dart';
import 'package:intern_task_week2/utils/route_generator.dart';
import 'package:intern_task_week2/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(360, 844),
          builder: (context, child) {
            return Consumer(builder: (context, ref, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: Colors.deepPurple,
                  ).copyWith(
                    primary: mainBlue,
                  ),
                ),
                onGenerateRoute: RouteGenerator.generateRoute,
                initialRoute: Routes.loginPage,
                supportedLocales: const [
                  Locale('en'),
                  Locale('hi'),
                  Locale('ne'),
                  Locale('zh'),
                  Locale('ms'),
                ],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                locale: ref.watch(localeProvider).locale,
              );
            });
          }),
    );
  }
}
