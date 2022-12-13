import 'package:goal_tracker_riverpod/src/features/goal/model/goal_collection.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal_progress.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';

import 'package:isar/isar.dart';

part 'goal.g.dart';

@collection
class Goal {
  Id id = Isar.autoIncrement;

  String? title;

  String? description;

  String? measures;

  DateTime? startDate;

  DateTime? endDate;

  final tags = IsarLinks<Tag>();

  final goalCollection = IsarLink<GoalCollection>();

  bool? isComplete;

  @Backlink(to: 'goal')
  final progress = IsarLinks<GoalProgress>();
}
