import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal_collection.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';

part 'goal_manager.g.dart';

@riverpod
class GoalManager extends _$GoalManager {
  //final Isar isar;
  // final GoalCollection parent;

  GoalManager();

  Future<void> addGoal(
    String title, {
    String? description,
    String? measures,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? tags,
  }) async {
    final isar = await ref.watch(isarInstanceProvider.future);
    final parent = await ref.watch(currentCollectionProvider.future);

    final goal = Goal()
      ..title = title
      ..description = description
      ..measures = measures
      ..startDate = startDate
      ..endDate = endDate
      ..goalCollection.value = parent;

    await isar.writeTxn(() async {
      await isar.goals.put(goal);
      await goal.goalCollection.save();
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

    _refreshData();
  }

  Future<List<Goal>> _getGoals() async {
    final isar = await ref.watch(isarInstanceProvider.future);
    final parent = await ref.watch(currentCollectionProvider.future);

    return isar.goals
        .filter()
        .goalCollection((q) => q.idEqualTo(parent!.id))
        .findAll();
    //return isar.goals.where().findAll();
  }

  Future<Goal?> getGoalById(int id) async {
    final isar = await ref.watch(isarInstanceProvider.future);
    return isar.goals.get(id);
  }

  Future<void> _refreshData() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getGoals());
  }

  @override
  FutureOr<List<Goal>> build() async {
    _refreshData();
    return _getGoals();
  }
}
