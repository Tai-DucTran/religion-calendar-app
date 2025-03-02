import 'package:religion_calendar_app/app.dart';
import 'package:religion_calendar_app/firebase_options/firebase_options_stg.dart';
import 'package:religion_calendar_app/src/modules/config/config.dart';

void main() {
  runMainApp(
    flavor: ConfigEnv.staging.toString(),
    firebaseOptions: DefaultFirebaseOptionsStg.currentPlatform,
  );
}
