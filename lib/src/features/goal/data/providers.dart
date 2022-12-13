import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/action_word_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/goal_collection_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/goal_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/goal_progress_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/tag_collection_manager.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/action_word.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal_collection.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/goal_progress.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isarInstance(FutureProviderRef ref) => Isar.open(
      [
        ActionWordSchema,
        GoalCollectionSchema,
        GoalProgressSchema,
        GoalSchema,
        TagSchema,
      ],
    );

@riverpod
Future<GoalCollectionManager> collectionManager(
    CollectionManagerRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return GoalCollectionManager(isar: isar);
}

@riverpod
Future<List<GoalCollection>> collections(CollectionsRef ref) async {
  final collectionManager = await ref.watch(collectionManagerProvider.future);
  return collectionManager.getCollections();
}

final currentCollectionIdProvider = StateProvider<int>((ref) => 0);

@riverpod
Future<GoalCollection?> currentCollection(CurrentCollectionRef ref) async {
  final collectionId = ref.watch(currentCollectionIdProvider.notifier).state;
  final goalCollectionManager =
      await ref.watch(collectionManagerProvider.future);

  return goalCollectionManager.getById(collectionId);
}

@riverpod
Future<TagCollectionManager> tagCollectionManager(
    TagCollectionManagerRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return TagCollectionManager(isar: isar);
}

final tagStartsWithProvider = StateProvider<String>((ref) => '');

@riverpod
Future<List<Tag>> tags(TagsRef ref) async {
  final tagCollectionManager =
      await ref.watch(tagCollectionManagerProvider.future);
  final tagStartsWithResult = ref.watch(tagStartsWithProvider);
  final tagUpdated = ref.watch(tagUpdatedProvider);

  if (tagUpdated) {
    ref.notifyListeners();
    ref.read(tagUpdatedProvider.notifier).state = false;
  }
  return tagCollectionManager.getTags(startsWith: tagStartsWithResult);
}

final tagUpdatedProvider = StateProvider<bool>((ref) => false);

@riverpod
Future<GoalManager> goalManager(GoalManagerRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  final goalCollection = await ref.watch(currentCollectionProvider.future);

  return GoalManager(isar: isar, parent: goalCollection!);
}

@riverpod
Future<List<Goal>> goals(GoalsRef ref) async {
  final goalManager = await ref.watch(goalManagerProvider.future);
  return goalManager.getGoals();
}

final currentGoalIdProvider = StateProvider<int>((ref) => 0);

@riverpod
Future<Goal?> currentGoal(CurrentGoalRef ref) async {
  final goalManager = await ref.watch(goalManagerProvider.future);
  final goalId = ref.watch(currentGoalIdProvider.notifier).state;

  return goalManager.getGoalById(goalId);
}

@riverpod
Future<GoalProgressManager> goalProgressManager(
    GoalProgressManagerRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  final goal = await ref.watch(currentGoalProvider.future);

  return GoalProgressManager(isar: isar, parent: goal ?? Goal());
}

@riverpod
Future<ActionWordManager> actionWordManager(ActionWordManagerRef ref) async {
  final isar = await ref.watch(isarInstanceProvider.future);
  return ActionWordManager(isar: isar);
}
