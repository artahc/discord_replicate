import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: ChannelRepository, env: [Env.TEST])
class MockChannelRepository extends Mock implements ChannelRepository {}
