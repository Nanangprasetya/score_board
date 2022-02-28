
import 'package:score_board/core/config/environment.dart';

void main() {
Production();

} 

class Production extends Environment {
  final String appVersion = '0.0.1';
  final String baseApi = '';
  final bool debug = false;
  final int delay = 0;
  final bool printResponse = false;
}
