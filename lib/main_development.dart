import 'package:religion_calendar_app/app/app.dart';
import 'package:religion_calendar_app/app/utils.dart';
import 'package:religion_calendar_app/firebase_options/firebase_options_development.dart';
import 'package:religion_calendar_app/src/modules/config/config.dart';

void main() async {
  await loadDotEnv();
  runMainApp(
    flavor: ConfigEnv.development.toString(),
    firebaseOptions: DefaultFirebaseOptionsDev.currentPlatform,
  );
}
