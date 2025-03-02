import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:religion_calendar_app/src/utils/log.dart';

Future<void> loadDotEnv() async {
  try {
    await dotenv.load(fileName: ".env");
  } catch (error) {
    Log.error("Erorr can't find .env");
  }
}
