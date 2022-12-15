import 'dart:async';

import 'package:flutter/material.dart';

import 'package:goal_tracker_riverpod/src/core/utils/color_conversions.dart';
import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/tag.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_collection_manager.g.dart';

@riverpod
class TagCollectionManager extends _$TagCollectionManager {
  TagCollectionManager();

  Future<void> _refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getTags());
  }

  Future<void> addTag({required String name, Color? color}) async {
    final isar = await ref.watch(isarInstanceProvider.future);

    final existingTag = await isar.tags.where().nameEqualTo(name).findAll();

    if (existingTag.isEmpty) {
      //add a new tag
      final newTag = Tag()
        ..name = name
        ..rawColor = ColorConversions.putToString(color);

      await isar.writeTxn(() async => await isar.tags.put(newTag));

      _refresh();
    }
  }

  Future<void> changeTagColor(int id, {required Color newColor}) async {
    final isar = await ref.watch(isarInstanceProvider.future);
    final existingTag = await isar.tags.get(id);

    if (existingTag != null) {
      existingTag.rawColor = ColorConversions.putToString(newColor);
      await isar.writeTxn(() async => await isar.tags.put(existingTag));
    }
    _refresh();
  }

  Future<List<Tag>> _getTags() async {
    final isar = await ref.watch(isarInstanceProvider.future);
    final startsWith = ref.watch(tagStartsWithProvider);
    if (startsWith.isNotEmpty) {
      return isar.tags.where().nameStartsWith(startsWith).findAll();
    } else {
      return isar.tags.where().sortByName().findAll();
    }
  }

  @override
  FutureOr<List<Tag>> build() async {
    await _refresh();
    return _getTags();
  }

  // Stream<List<Tag>> getTagStream() {
  //   return isar.tags
  //       .where()
  //       .anyName()
  //       .sortByName()
  //       .watch(fireImmediately: true);
  // }
}
