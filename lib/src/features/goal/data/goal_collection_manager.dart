import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/goal_collection.dart';
import 'providers.dart';

part 'goal_collection_manager.g.dart';

@riverpod
class GoalCollectionManager extends _$GoalCollectionManager {
  //final Isar isar;

  GoalCollectionManager();

  Future<void> addCollection(String name, {List<String>? tags}) async {
    final isar = await ref.watch(isarInstanceProvider.future);
    final newCollection = GoalCollection()..name = name;
    //..tags =

    await isar.writeTxn(() async {
      await isar.goalCollections.put(newCollection);

      if (tags != null && tags.isNotEmpty) {
        for (String tagName in tags) {
          final tag = await isar.tags.where().nameEqualTo(tagName).findFirst();
          if (tag != null) {
            newCollection.tags.add(tag);
          }
        }
      }
      await newCollection.tags.save();
    });
    _refreshData();
  }

  Future<List<GoalCollection>> _getCollections() async {
    final isar = await ref.watch(isarInstanceProvider.future);
    return isar.goalCollections.where().sortByName().findAll();
  }

  Future<GoalCollection?> getById(int id) async {
    final isar = await ref.watch(isarInstanceProvider.future);
    return isar.goalCollections.get(id);
  }

  Future<void> _refreshData() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getCollections());
  }

  @override
  FutureOr<List<GoalCollection>> build() async {
    _refreshData();
    return _getCollections();
  }
}
