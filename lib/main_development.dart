import 'package:religion_calendar_app/app.dart';
import 'package:religion_calendar_app/firebase_options/firebase_options_dev.dart';
import 'package:religion_calendar_app/src/modules/config/config.dart';

void main() {
  runMainApp(
    flavor: ConfigEnv.development.toString(),
    firebaseOptions: DefaultFirebaseOptionsDev.currentPlatform,
  );
}
