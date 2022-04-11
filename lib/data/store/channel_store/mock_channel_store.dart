import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Named("DB_CHANNEL")
@Injectable(as: Store<String, Channel>, env: [Env.TEST])
class MockHiveChannelStore extends Mock implements Store<String, Channel> {}

@Named("CACHE_CHANNEL")
@Injectable(as: Store<String, Channel>, env: [Env.TEST])
class MockCacheChannelStore extends Mock implements Store<String, Channel> {}
