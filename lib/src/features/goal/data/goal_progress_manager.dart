import 'package:goal_tracker_riverpod/src/features/goal/model/action_word.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal_progress.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:isar/isar.dart';

class GoalProgressManager {
  final Isar isar;
  final Goal parent;

  GoalProgressManager({required this.isar, required this.parent});

  Future<void> addProgress({
    String? title,
    String? description,
    DateTime? startDate,
    String? actionWord,
    List<String>? tags,
  }) async {
    final progress = GoalProgress()
      ..title = title
      ..description = description
      ..startDate = startDate;

    if (actionWord != null) {
      final ActionWord? isarActionWord =
          await isar.actionWords.where().wordEqualTo(actionWord).findFirst();

      if (isarActionWord != null) {
        progress.actionWord.value = isarActionWord;
      }
    }

    await isar.writeTxn(() async {
      await isar.goalProgress.put(progress);
      if (tags != null && tags.isNotEmpty) {
        for (String tagName in tags) {
          final Tag? tag =
              await isar.tags.where().nameEqualTo(tagName).findFirst();
          if (tag != null) {
            progress.tags.add(tag);
          }
        }
      }
      await progress.tags.save();
    });
  }

  Future<List<GoalProgress>> getProgressList() async {
    return parent.progress.toList();
  }
}
