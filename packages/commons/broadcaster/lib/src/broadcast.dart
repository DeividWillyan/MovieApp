import 'dart:async';

import 'package:broadcaster/src/broadcast_types_enum.dart';

class Broadcast {
  Broadcast._internal();
  static final Broadcast _singleton = Broadcast._internal();
  factory Broadcast() => _singleton;

  // ignore: close_sinks
  final _bus = StreamController.broadcast();

  // static StreamController get bus => _singleton._bus;

  static emit(BroadcastType event) {
    _singleton._bus.sink.add(event);
  }

  static get listen => _singleton._bus.stream.listen;
}
