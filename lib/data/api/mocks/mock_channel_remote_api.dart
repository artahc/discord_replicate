import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/api/channel_remote_api.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: ChannelRemoteApi, env: [Env.TEST])
class MockChannelRemoteApi extends Mock implements ChannelRemoteApi {}
