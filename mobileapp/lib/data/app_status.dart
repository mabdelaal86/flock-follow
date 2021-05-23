import 'flock.dart';
import 'user.dart';

class AppStatus {
  final User user;
  final Flock flock;

  AppStatus({this.user, this.flock});

  bool get registered => user != null;
  bool get joinedFlock => flock != null;
  bool get isLeader => joinedFlock && flock.leaderId != user.id;
}

Future<AppStatus> getAppStatus() async {
  final userId = await getUserLocalId();
  if (userId == 0)
    return AppStatus();
  final user = await readUser(userId);
  final flockId = user.currentFlockId;
  if (flockId == 0)
    return AppStatus(user: user);
  final flock = await readFlock(flockId);
  return AppStatus(user: user, flock: flock);
}
