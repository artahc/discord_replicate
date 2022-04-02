import 'package:discord_replicate/application/config/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: FirebaseAuth, env: [Env.TEST])
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

@module
abstract class FirebaseModule {
  @LazySingleton(env: [Env.DEV, Env.PROD])
  FirebaseAuth auth() => FirebaseAuth.instance;
}
