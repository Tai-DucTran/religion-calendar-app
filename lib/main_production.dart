import 'package:religion_calendar_app/app.dart';
import 'package:religion_calendar_app/firebase_options/firebase_options_prod.dart';
import 'package:religion_calendar_app/src/modules/config/config.dart';

void main() {
  runMainApp(
    flavor: ConfigEnv.production.toString(),
    firebaseOptions: DefaultFirebaseOptionsProd.currentPlatform,
  );
}
