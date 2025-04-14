// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'DEVELOPMENT_BASE_URL', obfuscate: true)
  static const String developmentBaseUrl = _Env.developmentBaseUrl;
  @EnviedField(varName: 'TEST_IMAGE_URL', obfuscate: true)
  static const String testImageUrl = _Env.testImageUrl;
}
