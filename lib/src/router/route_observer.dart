import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RoutePrinter extends LogPrinter {
  RoutePrinter();

  @override
  List<String> log(LogEvent event) {
    /* 
    - AnsiColor docs: https://en.wikipedia.org/wiki/ANSI_escape_code
    - Emoji:
      + Mac: Control + Command + Space. 
      + Windows: "Windows key" + ; (semicolon).
    */
    AnsiColor color = AnsiColor.fg(40);
    final message = event.message;
    return [color('🛣 $message')];
  }
}

class XRouteObserver extends AutoRouterObserver {
  final Logger log = Logger(printer: RoutePrinter());

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log.i('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log.i('Tab route re-visited: ${route.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {}
    log.i('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log.i('New route poped: ${route.settings.name}');
  }

  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.i('New route removed: ${route.settings.name}');
  }

  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log.i('New route replace: ${newRoute?.settings.name}' +
        '\n' +
        'Old route replace: ${oldRoute?.settings.name}');
  }

  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.i('New route start user gesture: ${route.settings.name}');
  }
}
