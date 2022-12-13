import 'package:isar/isar.dart';

part 'action_word.g.dart';

@collection
class ActionWord {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? word;

  @enumerated
  ActionWordType wordType = ActionWordType.undefined;
}

enum ActionWordType {
  undefined,
  leadership,
  management,
  coordination,
  teamwork,
}
