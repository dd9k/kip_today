import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static FluroRouter router = FluroRouter.appRouter;

  final List<AppRoute> _routes;
  final Handler _notFoundHandler;

  List<AppRoute> get routes => _routes;

  const AppRouter({
    @required List<AppRoute> routes,
    @required Handler notFoundHandler,
  })  : _routes = routes,
        _notFoundHandler = notFoundHandler;

  void setupRoutes() {
    router.notFoundHandler = _notFoundHandler;
    routes.forEach(
      (AppRoute route) => router.define(route.route, handler: route.handler),
    );
  }

  static Future<dynamic> pushToWithArguments(BuildContext context, String path,
      {@required Object arguments, bool isRemoveUntil = false, TransitionType transitionType = TransitionType.cupertino, Duration transitionDuration}) {
    return AppRouter.router.navigateTo(context, path,
        transition: transitionType,
        transitionDuration: transitionDuration,
        routeSettings: RouteSettings(arguments: arguments),
        clearStack: isRemoveUntil);
  }

  static Future<dynamic> pushTo(BuildContext context, String path,
      {bool isRemoveUntil = false, TransitionType transitionType = TransitionType.cupertino}) {
    return AppRouter.router.navigateTo(context, path,
        transition: transitionType, clearStack: isRemoveUntil);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void popWithArguments(BuildContext context, {Object arguments}) {
    AppRouter.router.pop(context, arguments);
  }
}
