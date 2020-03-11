import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static final String BASE_URL = DotEnv().env['API_BASE_URL'];
}
