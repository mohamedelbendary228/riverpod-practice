import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/websocket_client.dart';

final webSocketClientProvider =
    Provider<WebsocketClient>((ref) => FakeWebsocketClient());
    
final counterProvider = StreamProvider.family<int, int>(
  (ref, passedValue) {
    final wsClient = ref.watch(webSocketClientProvider);
    return wsClient.getCounterStream(passedValue);
  },
);
