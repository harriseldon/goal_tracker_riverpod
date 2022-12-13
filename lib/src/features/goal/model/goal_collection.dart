import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';

import 'package:isar/isar.dart';

part 'goal_collection.g.dart';

@collection
class GoalCollection {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String name;

  bool? isShared;

  var tags = IsarLinks<Tag>();
}
