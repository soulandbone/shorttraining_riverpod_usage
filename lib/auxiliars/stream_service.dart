import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamServiceProvider = Provider<StreamService>((ref) => StreamService());

class StreamService {
  Stream<int> getStream() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i);
  }
}

final streamValueProvider = StreamProvider((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});
