import 'package:goal_tracker_riverpod/src/features/goal/model/goal.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal_collection.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:isar/isar.dart';

class GoalManager {
  final Isar isar;
  final GoalCollection parent;

  GoalManager({
    required this.isar,
    required this.parent,
  });

  Future<void> addGoal(
    String title, {
    String? description,
    String? measures,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? tags,
  }) async {
    final goal = Goal()
      ..title = title
      ..description = description
      ..measures = measures
      ..startDate = startDate
      ..endDate = endDate
      ..goalCollection.value = parent;

    await isar.writeTxn(() async {
      await isar.goals.put(goal);
      if (tags != null && tags.isNotEmpty) {
        for (String tagName in tags) {
          final Tag? tag =
              await isar.tags.where().nameEqualTo(tagName).findFirst();
          if (tag != null) {
            goal.tags.add(tag);
          }
        }
      }
      await goal.tags.save();
    });
  }

  Future<List<Goal>> getGoals() async {
    return isar.goals.where().findAll();
  }

  Future<Goal?> getGoalById(int id) async {
    return isar.goals.get(id);
  }
}
