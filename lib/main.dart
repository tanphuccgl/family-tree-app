import 'package:familytree/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'src/app.dart';

Future main() async {
  usePathUrlStrategy();
  await ConfigApp.initializeApp();
  runApp(
    const MyApp(),
  );
}
