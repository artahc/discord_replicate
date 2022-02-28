abstract class LeaveServerUseCase {
  Future<void> invoke({required String serverId});
}

class LeaveServerUseCaseImpl implements LeaveServerUseCase {
  @override
  Future<void> invoke({required String serverId}) {
    throw UnimplementedError();
  }
}
