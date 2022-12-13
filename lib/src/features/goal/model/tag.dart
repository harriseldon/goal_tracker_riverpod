import 'package:isar/isar.dart';

part 'tag.g.dart';

@collection
class Tag {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? name;
  String? rawColor;
}
