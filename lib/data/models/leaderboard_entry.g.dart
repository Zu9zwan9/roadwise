// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLeaderboardEntryCollection on Isar {
  IsarCollection<LeaderboardEntry> get leaderboardEntrys => this.collection();
}

const LeaderboardEntrySchema = CollectionSchema(
  name: r'LeaderboardEntry',
  id: 7319789597401550990,
  properties: {
    r'averageAccuracy': PropertySchema(
      id: 0,
      name: r'averageAccuracy',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'leaderboardType': PropertySchema(
      id: 3,
      name: r'leaderboardType',
      type: IsarType.string,
    ),
    r'lessonsCompleted': PropertySchema(
      id: 4,
      name: r'lessonsCompleted',
      type: IsarType.long,
    ),
    r'level': PropertySchema(
      id: 5,
      name: r'level',
      type: IsarType.long,
    ),
    r'period': PropertySchema(
      id: 6,
      name: r'period',
      type: IsarType.string,
    ),
    r'previousRank': PropertySchema(
      id: 7,
      name: r'previousRank',
      type: IsarType.long,
    ),
    r'quizzesCompleted': PropertySchema(
      id: 8,
      name: r'quizzesCompleted',
      type: IsarType.long,
    ),
    r'rank': PropertySchema(
      id: 9,
      name: r'rank',
      type: IsarType.long,
    ),
    r'score': PropertySchema(
      id: 10,
      name: r'score',
      type: IsarType.long,
    ),
    r'streak': PropertySchema(
      id: 11,
      name: r'streak',
      type: IsarType.long,
    ),
    r'totalStudyTimeMinutes': PropertySchema(
      id: 12,
      name: r'totalStudyTimeMinutes',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userAvatarUrl': PropertySchema(
      id: 14,
      name: r'userAvatarUrl',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 15,
      name: r'userId',
      type: IsarType.long,
    ),
    r'userName': PropertySchema(
      id: 16,
      name: r'userName',
      type: IsarType.string,
    ),
    r'xp': PropertySchema(
      id: 17,
      name: r'xp',
      type: IsarType.long,
    )
  },
  estimateSize: _leaderboardEntryEstimateSize,
  serialize: _leaderboardEntrySerialize,
  deserialize: _leaderboardEntryDeserialize,
  deserializeProp: _leaderboardEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _leaderboardEntryGetId,
  getLinks: _leaderboardEntryGetLinks,
  attach: _leaderboardEntryAttach,
  version: '3.1.0+1',
);

int _leaderboardEntryEstimateSize(
  LeaderboardEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.leaderboardType.length * 3;
  bytesCount += 3 + object.period.length * 3;
  {
    final value = object.userAvatarUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userName.length * 3;
  return bytesCount;
}

void _leaderboardEntrySerialize(
  LeaderboardEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageAccuracy);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeString(offsets[3], object.leaderboardType);
  writer.writeLong(offsets[4], object.lessonsCompleted);
  writer.writeLong(offsets[5], object.level);
  writer.writeString(offsets[6], object.period);
  writer.writeLong(offsets[7], object.previousRank);
  writer.writeLong(offsets[8], object.quizzesCompleted);
  writer.writeLong(offsets[9], object.rank);
  writer.writeLong(offsets[10], object.score);
  writer.writeLong(offsets[11], object.streak);
  writer.writeLong(offsets[12], object.totalStudyTimeMinutes);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeString(offsets[14], object.userAvatarUrl);
  writer.writeLong(offsets[15], object.userId);
  writer.writeString(offsets[16], object.userName);
  writer.writeLong(offsets[17], object.xp);
}

LeaderboardEntry _leaderboardEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LeaderboardEntry();
  object.averageAccuracy = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.date = reader.readDateTime(offsets[2]);
  object.id = id;
  object.leaderboardType = reader.readString(offsets[3]);
  object.lessonsCompleted = reader.readLong(offsets[4]);
  object.level = reader.readLong(offsets[5]);
  object.period = reader.readString(offsets[6]);
  object.previousRank = reader.readLong(offsets[7]);
  object.quizzesCompleted = reader.readLong(offsets[8]);
  object.rank = reader.readLong(offsets[9]);
  object.score = reader.readLong(offsets[10]);
  object.streak = reader.readLong(offsets[11]);
  object.totalStudyTimeMinutes = reader.readLong(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  object.userAvatarUrl = reader.readStringOrNull(offsets[14]);
  object.userId = reader.readLong(offsets[15]);
  object.userName = reader.readString(offsets[16]);
  object.xp = reader.readLong(offsets[17]);
  return object;
}

P _leaderboardEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _leaderboardEntryGetId(LeaderboardEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _leaderboardEntryGetLinks(LeaderboardEntry object) {
  return [];
}

void _leaderboardEntryAttach(
    IsarCollection<dynamic> col, Id id, LeaderboardEntry object) {
  object.id = id;
}

extension LeaderboardEntryQueryWhereSort
    on QueryBuilder<LeaderboardEntry, LeaderboardEntry, QWhere> {
  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LeaderboardEntryQueryWhere
    on QueryBuilder<LeaderboardEntry, LeaderboardEntry, QWhereClause> {
  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterWhereClause> idBetween(
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
}

extension LeaderboardEntryQueryFilter
    on QueryBuilder<LeaderboardEntry, LeaderboardEntry, QFilterCondition> {
  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      averageAccuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageAccuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      averageAccuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageAccuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      averageAccuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageAccuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      averageAccuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageAccuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leaderboardType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'leaderboardType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'leaderboardType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'leaderboardType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'leaderboardType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'leaderboardType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'leaderboardType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'leaderboardType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leaderboardType',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      leaderboardTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'leaderboardType',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      lessonsCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonsCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      lessonsCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lessonsCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      lessonsCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lessonsCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      lessonsCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lessonsCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      levelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      levelGreaterThan(
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

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      levelLessThan(
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

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      levelBetween(
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

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'period',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'period',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'period',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      periodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'period',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      previousRankEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previousRank',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      previousRankGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'previousRank',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      previousRankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'previousRank',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      previousRankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'previousRank',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      quizzesCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quizzesCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      quizzesCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quizzesCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      quizzesCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quizzesCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      quizzesCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quizzesCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      rankEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      rankGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      rankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      rankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rank',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      scoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      scoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      scoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      streakEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      streakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      streakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streak',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      streakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      totalStudyTimeMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalStudyTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      totalStudyTimeMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalStudyTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      totalStudyTimeMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalStudyTimeMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      totalStudyTimeMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalStudyTimeMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userAvatarUrl',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userAvatarUrl',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userAvatarUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userAvatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userAvatarUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAvatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userAvatarUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userAvatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      xpEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xp',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      xpGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xp',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      xpLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xp',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterFilterCondition>
      xpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LeaderboardEntryQueryObject
    on QueryBuilder<LeaderboardEntry, LeaderboardEntry, QFilterCondition> {}

extension LeaderboardEntryQueryLinks
    on QueryBuilder<LeaderboardEntry, LeaderboardEntry, QFilterCondition> {}

extension LeaderboardEntryQuerySortBy
    on QueryBuilder<LeaderboardEntry, LeaderboardEntry, QSortBy> {
  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByAverageAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageAccuracy', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByAverageAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageAccuracy', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByLeaderboardType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaderboardType', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByLeaderboardTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaderboardType', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByLessonsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonsCompleted', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByLessonsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonsCompleted', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByPreviousRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousRank', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByPreviousRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousRank', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByQuizzesCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizzesCompleted', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByQuizzesCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizzesCompleted', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> sortByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByTotalStudyTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByTotalStudyTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByUserAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAvatarUrl', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByUserAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAvatarUrl', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> sortByXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xp', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      sortByXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xp', Sort.desc);
    });
  }
}

extension LeaderboardEntryQuerySortThenBy
    on QueryBuilder<LeaderboardEntry, LeaderboardEntry, QSortThenBy> {
  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByAverageAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageAccuracy', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByAverageAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageAccuracy', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByLeaderboardType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaderboardType', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByLeaderboardTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leaderboardType', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByLessonsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonsCompleted', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByLessonsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonsCompleted', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByPreviousRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousRank', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByPreviousRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousRank', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByQuizzesCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizzesCompleted', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByQuizzesCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizzesCompleted', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> thenByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streak', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByTotalStudyTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMinutes', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByTotalStudyTimeMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStudyTimeMinutes', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByUserAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAvatarUrl', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByUserAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAvatarUrl', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy> thenByXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xp', Sort.asc);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QAfterSortBy>
      thenByXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xp', Sort.desc);
    });
  }
}

extension LeaderboardEntryQueryWhereDistinct
    on QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct> {
  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByAverageAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageAccuracy');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByLeaderboardType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leaderboardType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByLessonsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lessonsCompleted');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct> distinctByPeriod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'period', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByPreviousRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'previousRank');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByQuizzesCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quizzesCompleted');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct> distinctByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rank');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streak');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByTotalStudyTimeMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStudyTimeMinutes');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByUserAvatarUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAvatarUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct>
      distinctByUserName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaderboardEntry, LeaderboardEntry, QDistinct> distinctByXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xp');
    });
  }
}

extension LeaderboardEntryQueryProperty
    on QueryBuilder<LeaderboardEntry, LeaderboardEntry, QQueryProperty> {
  QueryBuilder<LeaderboardEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LeaderboardEntry, double, QQueryOperations>
      averageAccuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageAccuracy');
    });
  }

  QueryBuilder<LeaderboardEntry, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LeaderboardEntry, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<LeaderboardEntry, String, QQueryOperations>
      leaderboardTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leaderboardType');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations>
      lessonsCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lessonsCompleted');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<LeaderboardEntry, String, QQueryOperations> periodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'period');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations> previousRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'previousRank');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations>
      quizzesCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quizzesCompleted');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations> rankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rank');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations> streakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streak');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations>
      totalStudyTimeMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStudyTimeMinutes');
    });
  }

  QueryBuilder<LeaderboardEntry, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<LeaderboardEntry, String?, QQueryOperations>
      userAvatarUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAvatarUrl');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<LeaderboardEntry, String, QQueryOperations> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userName');
    });
  }

  QueryBuilder<LeaderboardEntry, int, QQueryOperations> xpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xp');
    });
  }
}
