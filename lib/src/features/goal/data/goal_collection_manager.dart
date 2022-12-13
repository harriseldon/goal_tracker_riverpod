import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:isar/isar.dart';

import '../model/goal_collection.dart';

class GoalCollectionManager {
  final Isar isar;

  GoalCollectionManager({required this.isar});

  Future<void> addCollection(String name, {List<String>? tags}) async {
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
  }

  Future<List<GoalCollection>> getCollections() async {
    return isar.goalCollections.where().sortByName().findAll();
  }

  Future<GoalCollection?> getById(int id) async {
    return isar.goalCollections.get(id);
  }
}
