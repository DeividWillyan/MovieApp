import 'package:login/app/features/authenticator/presentation/ui/pages/authenticator_page.dart';
import 'package:micro_core/micro_core.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  void Function() get injectionsRegister => () {};

  @override
  String get microAppName => "micro_app_login";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/login': (_, __) => const AuthenticatorPage(),
      };

  @override
  void Function() get createListener => () {};
}
