import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/action_word.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal_progress.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'goal_progress_manager.g.dart';

@riverpod
class GoalProgressManager extends _$GoalProgressManager {
  // final Isar isar;
  // final Goal parent;

  GoalProgressManager();

  Future<void> addProgress({
    String? title,
    String? description,
    DateTime? startDate,
    String? actionWord,
    List<String>? tags,
  }) async {
    final isar = await ref.watch(isarInstanceProvider.future);
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
      await progress.goal.save();
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

  Future<List<GoalProgress>> _getProgressList() async {
    final isar = await ref.watch(isarInstanceProvider.future);
    final parent = await ref.watch(currentGoalProvider.future);

    return isar.goalProgress
        .filter()
        .goal((q) => q.idEqualTo(parent!.id))
        .findAll();
  }

  Future<void> _refreshData() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getProgressList());
  }

  @override
  FutureOr<List<GoalProgress>> build() async {
    _refreshData();
    return _getProgressList();
  }
}
