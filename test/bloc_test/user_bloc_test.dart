import 'package:bloc_test/bloc_test.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}
@GenerateMocks([UserRepository, GraphQLClientHelper,HiveDatabaseHelper])
void main() {
  var mockBloc = MockUserBloc();
  // var bloc = UserBloc()
  test('Load local user', () async {
    // whenListen(mockBloc, stream)
  });
}
