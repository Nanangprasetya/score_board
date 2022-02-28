
import 'package:score_board/core/config/environment.dart';

void main() {
  Development();
}

class Development extends Environment {
  final String appVersion = '0.0.1';
  final String baseApi = '';
  final bool debug = true;
  final int delay = 30000;
  final bool printResponse = true;
}
