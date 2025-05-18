import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  runApp(await builder());
}
