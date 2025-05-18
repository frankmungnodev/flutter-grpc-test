import 'dart:io';

import 'package:flutter_grpc/app/app.dart';
import 'package:flutter_grpc/bootstrap.dart';
import 'package:flutter_grpc/core/grpc/grpc_client.dart';
import 'package:grpc/grpc.dart';

void main() {
  getIt.registerLazySingleton<ClientChannel>(() {
    // For emulators host
    return GrpcClient.createChannel(
      host: Platform.isIOS ? 'localhost' : '10.0.2.2',
    );
  });

  bootstrap(() => const App());
}
