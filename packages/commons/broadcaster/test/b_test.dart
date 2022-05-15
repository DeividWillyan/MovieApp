import 'package:broadcaster/src/broadcast.dart';
import 'package:broadcaster/src/broadcast_types_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('description', () {
    Broadcast.listen(print);

    Broadcast.emit(BroadcastType.ATHENTICATION_SUCCESS);
  });
}
