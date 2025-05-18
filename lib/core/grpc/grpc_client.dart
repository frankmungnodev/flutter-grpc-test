import 'package:grpc/grpc.dart';

class GrpcClient {
  static ClientChannel createChannel({
    String host = '10.0.2.2',
    int port = 8080,
  }) {
    return ClientChannel(
      host,
      port: port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
  }
}
