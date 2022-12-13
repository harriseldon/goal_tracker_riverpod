// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_word.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetActionWordCollection on Isar {
  IsarCollection<ActionWord> get actionWords => this.collection();
}

const ActionWordSchema = CollectionSchema(
  name: r'ActionWord',
  id: -418177458454952656,
  properties: {
    r'word': PropertySchema(
      id: 0,
      name: r'word',
      type: IsarType.string,
    ),
    r'wordType': PropertySchema(
      id: 1,
      name: r'wordType',
      type: IsarType.byte,
      enumMap: _ActionWordwordTypeEnumValueMap,
    )
  },
  estimateSize: _actionWordEstimateSize,
  serialize: _actionWordSerialize,
  deserialize: _actionWordDeserialize,
  deserializeProp: _actionWordDeserializeProp,
  idName: r'id',
  indexes: {
    r'word': IndexSchema(
      id: -2031626334120420267,
      name: r'word',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'word',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _actionWordGetId,
  getLinks: _actionWordGetLinks,
  attach: _actionWordAttach,
  version: '3.0.5',
);

int _actionWordEstimateSize(
  ActionWord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.word;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _actionWordSerialize(
  ActionWord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.word);
  writer.writeByte(offsets[1], object.wordType.index);
}

ActionWord _actionWordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ActionWord();
  object.id = id;
  object.word = reader.readStringOrNull(offsets[0]);
  object.wordType =
      _ActionWordwordTypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          ActionWordType.undefined;
  return object;
}

P _actionWordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_ActionWordwordTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          ActionWordType.undefined) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ActionWordwordTypeEnumValueMap = {
  'undefined': 0,
  'leadership': 1,
  'management': 2,
  'coordination': 3,
  'teamwork': 4,
};
const _ActionWordwordTypeValueEnumMap = {
  0: ActionWordType.undefined,
  1: ActionWordType.leadership,
  2: ActionWordType.management,
  3: ActionWordType.coordination,
  4: ActionWordType.teamwork,
};

Id _actionWordGetId(ActionWord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _actionWordGetLinks(ActionWord object) {
  return [];
}

void _actionWordAttach(IsarCollection<dynamic> col, Id id, ActionWord object) {
  object.id = id;
}

extension ActionWordQueryWhereSort
    on QueryBuilder<ActionWord, ActionWord, QWhere> {
  QueryBuilder<ActionWord, ActionWord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhere> anyWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'word'),
      );
    });
  }
}

extension ActionWordQueryWhere
    on QueryBuilder<ActionWord, ActionWord, QWhereClause> {
  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'word',
        value: [null],
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'word',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordEqualTo(
      String? word) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'word',
        value: [word],
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordNotEqualTo(
      String? word) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'word',
              lower: [],
              upper: [word],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'word',
              lower: [word],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'word',
              lower: [word],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'word',
              lower: [],
              upper: [word],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordGreaterThan(
    String? word, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'word',
        lower: [word],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordLessThan(
    String? word, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'word',
        lower: [],
        upper: [word],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordBetween(
    String? lowerWord,
    String? upperWord, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'word',
        lower: [lowerWord],
        includeLower: includeLower,
        upper: [upperWord],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordStartsWith(
      String WordPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'word',
        lower: [WordPrefix],
        upper: ['$WordPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'word',
        value: [''],
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterWhereClause> wordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'word',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'word',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'word',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'word',
              upper: [''],
            ));
      }
    });
  }
}

extension ActionWordQueryFilter
    on QueryBuilder<ActionWord, ActionWord, QFilterCondition> {
  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'word',
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'word',
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'word',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'word',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'word',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'word',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'word',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordTypeEqualTo(
      ActionWordType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordType',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition>
      wordTypeGreaterThan(
    ActionWordType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wordType',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordTypeLessThan(
    ActionWordType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wordType',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterFilterCondition> wordTypeBetween(
    ActionWordType lower,
    ActionWordType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wordType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActionWordQueryObject
    on QueryBuilder<ActionWord, ActionWord, QFilterCondition> {}

extension ActionWordQueryLinks
    on QueryBuilder<ActionWord, ActionWord, QFilterCondition> {}

extension ActionWordQuerySortBy
    on QueryBuilder<ActionWord, ActionWord, QSortBy> {
  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> sortByWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.asc);
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> sortByWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.desc);
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> sortByWordType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordType', Sort.asc);
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> sortByWordTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordType', Sort.desc);
    });
  }
}

extension ActionWordQuerySortThenBy
    on QueryBuilder<ActionWord, ActionWord, QSortThenBy> {
  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> thenByWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.asc);
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> thenByWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'word', Sort.desc);
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> thenByWordType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordType', Sort.asc);
    });
  }

  QueryBuilder<ActionWord, ActionWord, QAfterSortBy> thenByWordTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordType', Sort.desc);
    });
  }
}

extension ActionWordQueryWhereDistinct
    on QueryBuilder<ActionWord, ActionWord, QDistinct> {
  QueryBuilder<ActionWord, ActionWord, QDistinct> distinctByWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'word', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActionWord, ActionWord, QDistinct> distinctByWordType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordType');
    });
  }
}

extension ActionWordQueryProperty
    on QueryBuilder<ActionWord, ActionWord, QQueryProperty> {
  QueryBuilder<ActionWord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ActionWord, String?, QQueryOperations> wordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'word');
    });
  }

  QueryBuilder<ActionWord, ActionWordType, QQueryOperations>
      wordTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordType');
    });
  }
}
