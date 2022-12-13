import 'package:goal_tracker_riverpod/src/features/goal/model/action_word.dart';
import 'package:isar/isar.dart';

class ActionWordManager {
  final Isar isar;

  ActionWordManager({required this.isar});

  Future<void> addActionWord({
    String? actionWord,
    ActionWordType actionWordType = ActionWordType.undefined,
  }) async {
    final newActionWord = ActionWord()
      ..word = actionWord
      ..wordType = actionWordType;

    await isar.writeTxn(() async {
      await isar.actionWords.put(newActionWord);
    });
  }

  Future<List<ActionWord>> getActionWords() async {
    return isar.actionWords.where().findAll();
  }
}
