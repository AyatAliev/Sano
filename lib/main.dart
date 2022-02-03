import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sano/presentation/screen/catalog/catalog_screen.dart';

import 'di.dart';

void main() async {
  await di();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Color(0xFFFAFAFA),
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CatalogScreen.routeName,
      title: 'Sano',
      routes: {
        CatalogScreen.routeName: (BuildContext context) => const CatalogScreen(),
      },
    );
  }
}