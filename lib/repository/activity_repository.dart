import 'dart:async';

class Activity {
  final String action;
  final DateTime date;

  Activity({required this.action, required this.date});
}

class ActivityRepository {
  Future<List<Activity>> loadRecentActivity() {
    return Future.value([
      Activity(action: "Room", date: DateTime.now()),
    ]);
  }
}
