import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> launchScreen(Widget child,
    {bool pushAndRemove = false, bool replace = false}) async {
  const Duration duration = Duration(milliseconds: 100);
  final Route route = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const Offset begin = Offset(1.0, 0.0);
      const Offset end = Offset.zero;
      const Curve curve = Curves.easeInOut;

      final Animatable<Offset> tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final Animation<Offset> offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: duration,
  );
  BuildContext context = Get.context!;
  if (pushAndRemove) {
    return Navigator.of(context)
        .pushAndRemoveUntil(route, (Route<dynamic> route) => false);
  } else if (replace) {
    return Navigator.of(context).pushReplacement(route);
  } else {
    return Navigator.of(context).push(route);
  }
}

// Convert widget to route name
String routeName(Widget widget) {
  // Get the class name of the widget as a string
  String className = widget.runtimeType.toString();

  // Remove "Screen" or other suffixes if needed
  if (className.endsWith('Screen')) {
    className = className.replaceAll('Screen', '');
  }

  // Convert to lowercase for route name
  String route = className.toLowerCase();

  return route;
}

void pop() => Navigator.of(Get.context!).pop();
