import 'package:goal_tracker_riverpod/src/features/goal/model/action_word.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';

import 'package:isar/isar.dart';

part 'goal_progress.g.dart';

@collection
class GoalProgress {
  Id id = Isar.autoIncrement;
  final actionWord = IsarLink<ActionWord>();

  String? title;

  String? description;

  DateTime? startDate;

  @Index(type: IndexType.value)
  final goal = IsarLink<Goal>();

  final tags = IsarLinks<Tag>();
}
