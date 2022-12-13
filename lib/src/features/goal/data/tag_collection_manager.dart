import 'package:flutter/material.dart';
import 'package:goal_tracker_riverpod/src/core/utils/color_conversions.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:isar/isar.dart';

class TagCollectionManager {
  final Isar isar;

  TagCollectionManager({required this.isar});

  Future<void> addTag({required String name, Color? color}) async {
    final existingTag = await isar.tags.where().nameEqualTo(name).findAll();

    if (existingTag.isEmpty) {
      //add a new tag
      final newTag = Tag()
        ..name = name
        ..rawColor = ColorConversions.putToString(color);

      await isar.writeTxn(() async => await isar.tags.put(newTag));
    }
  }

  Future<void> changeTagColor(int id, {required Color newColor}) async {
    final existingTag = await isar.tags.get(id);

    if (existingTag != null) {
      existingTag.rawColor = ColorConversions.putToString(newColor);
      await isar.writeTxn(() async => await isar.tags.put(existingTag));
    }
  }

  Future<List<Tag>> getTags({String? startsWith}) async {
    if (startsWith != null && startsWith.isNotEmpty) {
      return isar.tags.where().nameStartsWith(startsWith).findAll();
    } else {
      return isar.tags.where().sortByName().findAll();
    }
  }

  Stream<List<Tag>> getTagStream() {
    return isar.tags
        .where()
        .anyName()
        .sortByName()
        .watch(fireImmediately: true);
  }
}
