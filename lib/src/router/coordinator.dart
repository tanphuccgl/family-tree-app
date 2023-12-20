import 'package:familytree/src/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class XCoordinator {
  static XRouter get rootRouter => GetIt.I<XRouter>();

  static BuildContext get context =>
      rootRouter.navigatorKey.currentState!.context;

  static Future<bool> pop<T extends Object?>([T? result]) async {
    return rootRouter.pop(result);
  }
}
