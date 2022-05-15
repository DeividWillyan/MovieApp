import 'package:broadcaster/broadcaster.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class AuthenticatorPage extends StatelessWidget {
  const AuthenticatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            TextField(),
            TextField(),
            ElevatedButton(
              onPressed: () {
                Broadcast.emit(BroadcastType.ATHENTICATION_SUCCESS);
                navigatorKey.currentState?.pushReplacementNamed('/home');
              },
              child: const Text('Entrar'),
            )
          ],
        ),
      ),
    );
  }
}
