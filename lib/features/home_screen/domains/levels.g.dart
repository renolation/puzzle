// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levels.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLevelsCollection on Isar {
  IsarCollection<Levels> get LevelsSchema => this.collection();
}

const LevelsSchema = CollectionSchema(
  name: r'Levels',
  id: 3622154275328290718,
  properties: {
    r'difficulty': PropertySchema(
      id: 0,
      name: r'difficulty',
      type: IsarType.long,
    ),
    r'finish': PropertySchema(
      id: 1,
      name: r'finish',
      type: IsarType.long,
    ),
    r'level': PropertySchema(
      id: 2,
      name: r'level',
      type: IsarType.long,
    ),
    r'matrix': PropertySchema(
      id: 3,
      name: r'matrix',
      type: IsarType.long,
    ),
    r'pathAsset': PropertySchema(
      id: 4,
      name: r'pathAsset',
      type: IsarType.string,
    ),
    r'remainTime': PropertySchema(
      id: 5,
      name: r'remainTime',
      type: IsarType.long,
    ),
    r'step': PropertySchema(
      id: 6,
      name: r'step',
      type: IsarType.long,
    ),
    r'time': PropertySchema(
      id: 7,
      name: r'time',
      type: IsarType.long,
    )
  },
  estimateSize: _levelsEstimateSize,
  serialize: _levelsSerialize,
  deserialize: _levelsDeserialize,
  deserializeProp: _levelsDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _levelsGetId,
  getLinks: _levelsGetLinks,
  attach: _levelsAttach,
  version: '3.0.5',
);

int _levelsEstimateSize(
  Levels object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pathAsset.length * 3;
  return bytesCount;
}

void _levelsSerialize(
  Levels object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.difficulty);
  writer.writeLong(offsets[1], object.finish);
  writer.writeLong(offsets[2], object.level);
  writer.writeLong(offsets[3], object.matrix);
  writer.writeString(offsets[4], object.pathAsset);
  writer.writeLong(offsets[5], object.remainTime);
  writer.writeLong(offsets[6], object.step);
  writer.writeLong(offsets[7], object.time);
}

Levels _levelsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Levels(
    difficulty: reader.readLong(offsets[0]),
    finish: reader.readLong(offsets[1]),
    level: reader.readLong(offsets[2]),
    matrix: reader.readLong(offsets[3]),
    pathAsset: reader.readString(offsets[4]),
    remainTime: reader.readLongOrNull(offsets[5]),
    step: reader.readLong(offsets[6]),
    time: reader.readLong(offsets[7]),
  );
  return object;
}

P _levelsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _levelsGetId(Levels object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _levelsGetLinks(Levels object) {
  return [];
}

void _levelsAttach(IsarCollection<dynamic> col, Id id, Levels object) {}

extension LevelsQueryWhereSort on QueryBuilder<Levels, Levels, QWhere> {
  QueryBuilder<Levels, Levels, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LevelsQueryWhere on QueryBuilder<Levels, Levels, QWhereClause> {
  QueryBuilder<Levels, Levels, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Levels, Levels, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Levels, Levels, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Levels, Levels, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LevelsQueryFilter on QueryBuilder<Levels, Levels, QFilterCondition> {
  QueryBuilder<Levels, Levels, QAfterFilterCondition> difficultyEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> difficultyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> difficultyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> difficultyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difficulty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> finishEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finish',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> finishGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finish',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> finishLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finish',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> finishBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finish',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> isarIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> levelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> levelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> levelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> levelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> matrixEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matrix',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> matrixGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matrix',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> matrixLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matrix',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> matrixBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matrix',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathAsset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathAsset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathAsset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathAsset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathAsset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathAsset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathAsset',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathAsset',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathAsset',
        value: '',
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> pathAssetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathAsset',
        value: '',
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> remainTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remainTime',
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> remainTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remainTime',
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> remainTimeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remainTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> remainTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remainTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> remainTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remainTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> remainTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remainTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> stepEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'step',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> stepGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'step',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> stepLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'step',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> stepBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'step',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> timeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> timeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> timeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Levels, Levels, QAfterFilterCondition> timeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LevelsQueryObject on QueryBuilder<Levels, Levels, QFilterCondition> {}

extension LevelsQueryLinks on QueryBuilder<Levels, Levels, QFilterCondition> {}

extension LevelsQuerySortBy on QueryBuilder<Levels, Levels, QSortBy> {
  QueryBuilder<Levels, Levels, QAfterSortBy> sortByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finish', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByFinishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finish', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByMatrix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByMatrixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByPathAsset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathAsset', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByPathAssetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathAsset', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByRemainTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainTime', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByRemainTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainTime', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension LevelsQuerySortThenBy on QueryBuilder<Levels, Levels, QSortThenBy> {
  QueryBuilder<Levels, Levels, QAfterSortBy> thenByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finish', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByFinishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finish', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByMatrix() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByMatrixDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByPathAsset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathAsset', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByPathAssetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathAsset', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByRemainTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainTime', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByRemainTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainTime', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'step', Sort.desc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Levels, Levels, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension LevelsQueryWhereDistinct on QueryBuilder<Levels, Levels, QDistinct> {
  QueryBuilder<Levels, Levels, QDistinct> distinctByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficulty');
    });
  }

  QueryBuilder<Levels, Levels, QDistinct> distinctByFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finish');
    });
  }

  QueryBuilder<Levels, Levels, QDistinct> distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level');
    });
  }

  QueryBuilder<Levels, Levels, QDistinct> distinctByMatrix() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matrix');
    });
  }

  QueryBuilder<Levels, Levels, QDistinct> distinctByPathAsset(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathAsset', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Levels, Levels, QDistinct> distinctByRemainTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainTime');
    });
  }

  QueryBuilder<Levels, Levels, QDistinct> distinctByStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'step');
    });
  }

  QueryBuilder<Levels, Levels, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }
}

extension LevelsQueryProperty on QueryBuilder<Levels, Levels, QQueryProperty> {
  QueryBuilder<Levels, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Levels, int, QQueryOperations> difficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulty');
    });
  }

  QueryBuilder<Levels, int, QQueryOperations> finishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finish');
    });
  }

  QueryBuilder<Levels, int, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<Levels, int, QQueryOperations> matrixProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matrix');
    });
  }

  QueryBuilder<Levels, String, QQueryOperations> pathAssetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathAsset');
    });
  }

  QueryBuilder<Levels, int?, QQueryOperations> remainTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainTime');
    });
  }

  QueryBuilder<Levels, int, QQueryOperations> stepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'step');
    });
  }

  QueryBuilder<Levels, int, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Levels _$$_LevelsFromJson(Map<String, dynamic> json) => _$_Levels(
      id: json['id'] as int?,
      difficulty: json['difficulty'] as int,
      level: json['level'] as int,
      step: json['step'] as int,
      time: json['time'] as int,
      pathAsset: json['pathAsset'] as String,
      matrix: json['matrix'] as int,
      remainTime: json['remainTime'] as int?,
      finish: json['finish'] as int? ?? 0,
    );

Map<String, dynamic> _$$_LevelsToJson(_$_Levels instance) => <String, dynamic>{
      'id': instance.id,
      'difficulty': instance.difficulty,
      'level': instance.level,
      'step': instance.step,
      'time': instance.time,
      'pathAsset': instance.pathAsset,
      'matrix': instance.matrix,
      'remainTime': instance.remainTime,
      'finish': instance.finish,
    };
