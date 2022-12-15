import 'dart:async';

import 'package:goal_tracker_riverpod/src/features/goal/data/providers.dart';
import 'package:goal_tracker_riverpod/src/features/goal/model/action_word.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'action_word_manager.g.dart';

@riverpod
class ActionWordManager extends _$ActionWordManager {
  //final Isar isar;

  ActionWordManager();

  Future<void> addActionWord({
    String? actionWord,
    ActionWordType actionWordType = ActionWordType.undefined,
  }) async {
    final isar = await ref.watch(isarInstanceProvider.future);

    final newActionWord = ActionWord()
      ..word = actionWord
      ..wordType = actionWordType;

    await isar.writeTxn(() async {
      await isar.actionWords.put(newActionWord);
    });

    _refresh();
  }

  Future<List<ActionWord>> _getActionWords() async {
    final isar = await ref.watch(isarInstanceProvider.future);
    return isar.actionWords.where().findAll();
  }

  Future<void> _refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getActionWords());
  }

  @override
  FutureOr<List<ActionWord>> build() async {
    return _getActionWords();
  }
}
