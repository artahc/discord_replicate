import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/application/usecase/user/get_current_user_usecase_impl.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';

abstract class JoinServerUseCase {
  Future<Server> invoke({required String serverId});
}
