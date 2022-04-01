import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Injectable(as: Store<Channel>, env: [Env.TEST])
class MockChannelStore extends Mock implements Store<Channel> {}
