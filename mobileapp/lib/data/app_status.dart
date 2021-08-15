import 'package:flock_follow/data/user_location.dart';

import 'flock.dart';
import 'user.dart';

class AppStatus {
  final User user;
  final Flock flock;
  final bool locationAllowed;

  AppStatus({this.user, this.flock, this.locationAllowed = true});

  bool get registered => user != null;
  bool get joinedFlock => flock != null;
  bool get isLeader => joinedFlock && flock.leaderId == user.id;
}

Future<AppStatus> getAppStatus() async {
  var locationAllowed = await isLocationAllowed();
  if (!locationAllowed) {
    return AppStatus(locationAllowed: false);
  }
  final userId = await getUserLocalId();
  if (userId == 0) {
    return AppStatus();
  }
  final user = await readUser(userId);
  final flockId = user.currentFlockId;
  if (flockId == 0) {
    return AppStatus(user: user);
  }
  final flock = await readFlock(flockId);
  return AppStatus(user: user, flock: flock);
}
