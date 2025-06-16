// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_package.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOfflinePackageCollection on Isar {
  IsarCollection<OfflinePackage> get offlinePackages => this.collection();
}

const OfflinePackageSchema = CollectionSchema(
  name: r'OfflinePackage',
  id: 6003969846532826819,
  properties: {
    r'autoSync': PropertySchema(
      id: 0,
      name: r'autoSync',
      type: IsarType.bool,
    ),
    r'canRetry': PropertySchema(
      id: 1,
      name: r'canRetry',
      type: IsarType.bool,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'downloadCompletedAt': PropertySchema(
      id: 3,
      name: r'downloadCompletedAt',
      type: IsarType.dateTime,
    ),
    r'downloadDurationText': PropertySchema(
      id: 4,
      name: r'downloadDurationText',
      type: IsarType.string,
    ),
    r'downloadProgressText': PropertySchema(
      id: 5,
      name: r'downloadProgressText',
      type: IsarType.string,
    ),
    r'downloadStartedAt': PropertySchema(
      id: 6,
      name: r'downloadStartedAt',
      type: IsarType.dateTime,
    ),
    r'downloadedAssets': PropertySchema(
      id: 7,
      name: r'downloadedAssets',
      type: IsarType.stringList,
    ),
    r'downloadedSize': PropertySchema(
      id: 8,
      name: r'downloadedSize',
      type: IsarType.long,
    ),
    r'downloadedSizeText': PropertySchema(
      id: 9,
      name: r'downloadedSizeText',
      type: IsarType.string,
    ),
    r'errorMessage': PropertySchema(
      id: 10,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'failedAssets': PropertySchema(
      id: 11,
      name: r'failedAssets',
      type: IsarType.stringList,
    ),
    r'isCompleted': PropertySchema(
      id: 12,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'isDownloading': PropertySchema(
      id: 13,
      name: r'isDownloading',
      type: IsarType.bool,
    ),
    r'isFailed': PropertySchema(
      id: 14,
      name: r'isFailed',
      type: IsarType.bool,
    ),
    r'isPaused': PropertySchema(
      id: 15,
      name: r'isPaused',
      type: IsarType.bool,
    ),
    r'isPending': PropertySchema(
      id: 16,
      name: r'isPending',
      type: IsarType.bool,
    ),
    r'isPremiumContent': PropertySchema(
      id: 17,
      name: r'isPremiumContent',
      type: IsarType.bool,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 18,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'lessonIds': PropertySchema(
      id: 19,
      name: r'lessonIds',
      type: IsarType.longList,
    ),
    r'maxRetries': PropertySchema(
      id: 20,
      name: r'maxRetries',
      type: IsarType.long,
    ),
    r'needsSync': PropertySchema(
      id: 21,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'packageDescription': PropertySchema(
      id: 22,
      name: r'packageDescription',
      type: IsarType.string,
    ),
    r'packageName': PropertySchema(
      id: 23,
      name: r'packageName',
      type: IsarType.string,
    ),
    r'progress': PropertySchema(
      id: 24,
      name: r'progress',
      type: IsarType.double,
    ),
    r'progressPercentage': PropertySchema(
      id: 25,
      name: r'progressPercentage',
      type: IsarType.double,
    ),
    r'progressText': PropertySchema(
      id: 26,
      name: r'progressText',
      type: IsarType.string,
    ),
    r'quizIds': PropertySchema(
      id: 27,
      name: r'quizIds',
      type: IsarType.longList,
    ),
    r'retryCount': PropertySchema(
      id: 28,
      name: r'retryCount',
      type: IsarType.long,
    ),
    r'sizeText': PropertySchema(
      id: 29,
      name: r'sizeText',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 30,
      name: r'status',
      type: IsarType.string,
    ),
    r'statusText': PropertySchema(
      id: 31,
      name: r'statusText',
      type: IsarType.string,
    ),
    r'topicIds': PropertySchema(
      id: 32,
      name: r'topicIds',
      type: IsarType.longList,
    ),
    r'totalSize': PropertySchema(
      id: 33,
      name: r'totalSize',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 34,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 35,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _offlinePackageEstimateSize,
  serialize: _offlinePackageSerialize,
  deserialize: _offlinePackageDeserialize,
  deserializeProp: _offlinePackageDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _offlinePackageGetId,
  getLinks: _offlinePackageGetLinks,
  attach: _offlinePackageAttach,
  version: '3.1.0+1',
);

int _offlinePackageEstimateSize(
  OfflinePackage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.downloadDurationText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.downloadProgressText.length * 3;
  bytesCount += 3 + object.downloadedAssets.length * 3;
  {
    for (var i = 0; i < object.downloadedAssets.length; i++) {
      final value = object.downloadedAssets[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.downloadedSizeText.length * 3;
  {
    final value = object.errorMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.failedAssets.length * 3;
  {
    for (var i = 0; i < object.failedAssets.length; i++) {
      final value = object.failedAssets[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.lessonIds.length * 8;
  bytesCount += 3 + object.packageDescription.length * 3;
  bytesCount += 3 + object.packageName.length * 3;
  bytesCount += 3 + object.progressText.length * 3;
  bytesCount += 3 + object.quizIds.length * 8;
  bytesCount += 3 + object.sizeText.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.statusText.length * 3;
  bytesCount += 3 + object.topicIds.length * 8;
  return bytesCount;
}

void _offlinePackageSerialize(
  OfflinePackage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.autoSync);
  writer.writeBool(offsets[1], object.canRetry);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDateTime(offsets[3], object.downloadCompletedAt);
  writer.writeString(offsets[4], object.downloadDurationText);
  writer.writeString(offsets[5], object.downloadProgressText);
  writer.writeDateTime(offsets[6], object.downloadStartedAt);
  writer.writeStringList(offsets[7], object.downloadedAssets);
  writer.writeLong(offsets[8], object.downloadedSize);
  writer.writeString(offsets[9], object.downloadedSizeText);
  writer.writeString(offsets[10], object.errorMessage);
  writer.writeStringList(offsets[11], object.failedAssets);
  writer.writeBool(offsets[12], object.isCompleted);
  writer.writeBool(offsets[13], object.isDownloading);
  writer.writeBool(offsets[14], object.isFailed);
  writer.writeBool(offsets[15], object.isPaused);
  writer.writeBool(offsets[16], object.isPending);
  writer.writeBool(offsets[17], object.isPremiumContent);
  writer.writeDateTime(offsets[18], object.lastSyncedAt);
  writer.writeLongList(offsets[19], object.lessonIds);
  writer.writeLong(offsets[20], object.maxRetries);
  writer.writeBool(offsets[21], object.needsSync);
  writer.writeString(offsets[22], object.packageDescription);
  writer.writeString(offsets[23], object.packageName);
  writer.writeDouble(offsets[24], object.progress);
  writer.writeDouble(offsets[25], object.progressPercentage);
  writer.writeString(offsets[26], object.progressText);
  writer.writeLongList(offsets[27], object.quizIds);
  writer.writeLong(offsets[28], object.retryCount);
  writer.writeString(offsets[29], object.sizeText);
  writer.writeString(offsets[30], object.status);
  writer.writeString(offsets[31], object.statusText);
  writer.writeLongList(offsets[32], object.topicIds);
  writer.writeLong(offsets[33], object.totalSize);
  writer.writeDateTime(offsets[34], object.updatedAt);
  writer.writeLong(offsets[35], object.userId);
}

OfflinePackage _offlinePackageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OfflinePackage();
  object.autoSync = reader.readBool(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.downloadCompletedAt = reader.readDateTimeOrNull(offsets[3]);
  object.downloadStartedAt = reader.readDateTimeOrNull(offsets[6]);
  object.downloadedAssets = reader.readStringList(offsets[7]) ?? [];
  object.downloadedSize = reader.readLong(offsets[8]);
  object.errorMessage = reader.readStringOrNull(offsets[10]);
  object.failedAssets = reader.readStringList(offsets[11]) ?? [];
  object.id = id;
  object.isPremiumContent = reader.readBool(offsets[17]);
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[18]);
  object.lessonIds = reader.readLongList(offsets[19]) ?? [];
  object.maxRetries = reader.readLong(offsets[20]);
  object.packageDescription = reader.readString(offsets[22]);
  object.packageName = reader.readString(offsets[23]);
  object.progress = reader.readDouble(offsets[24]);
  object.quizIds = reader.readLongList(offsets[27]) ?? [];
  object.retryCount = reader.readLong(offsets[28]);
  object.status = reader.readString(offsets[30]);
  object.topicIds = reader.readLongList(offsets[32]) ?? [];
  object.totalSize = reader.readLong(offsets[33]);
  object.updatedAt = reader.readDateTime(offsets[34]);
  object.userId = reader.readLong(offsets[35]);
  return object;
}

P _offlinePackageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readLongList(offset) ?? []) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readBool(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readDouble(offset)) as P;
    case 25:
      return (reader.readDouble(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readLongList(offset) ?? []) as P;
    case 28:
      return (reader.readLong(offset)) as P;
    case 29:
      return (reader.readString(offset)) as P;
    case 30:
      return (reader.readString(offset)) as P;
    case 31:
      return (reader.readString(offset)) as P;
    case 32:
      return (reader.readLongList(offset) ?? []) as P;
    case 33:
      return (reader.readLong(offset)) as P;
    case 34:
      return (reader.readDateTime(offset)) as P;
    case 35:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _offlinePackageGetId(OfflinePackage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _offlinePackageGetLinks(OfflinePackage object) {
  return [];
}

void _offlinePackageAttach(
    IsarCollection<dynamic> col, Id id, OfflinePackage object) {
  object.id = id;
}

extension OfflinePackageQueryWhereSort
    on QueryBuilder<OfflinePackage, OfflinePackage, QWhere> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OfflinePackageQueryWhere
    on QueryBuilder<OfflinePackage, OfflinePackage, QWhereClause> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterWhereClause> idBetween(
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

extension OfflinePackageQueryFilter
    on QueryBuilder<OfflinePackage, OfflinePackage, QFilterCondition> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      autoSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoSync',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      canRetryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canRetry',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadCompletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadCompletedAt',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadCompletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadCompletedAt',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadCompletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadCompletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadCompletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadCompletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadCompletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadCompletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadCompletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadCompletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadDurationText',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadDurationText',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadDurationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadDurationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadDurationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadDurationText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'downloadDurationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'downloadDurationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadDurationText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadDurationText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadDurationText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadDurationTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadDurationText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadProgressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadProgressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadProgressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadProgressText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'downloadProgressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'downloadProgressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadProgressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadProgressText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadProgressText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadProgressTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadProgressText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadStartedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadStartedAt',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadStartedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadStartedAt',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadStartedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadStartedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadStartedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadStartedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadStartedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadStartedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadStartedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadStartedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadedAssets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'downloadedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'downloadedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadedAssets',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadedAssets',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadedAssets',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'downloadedAssets',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'downloadedAssets',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'downloadedAssets',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'downloadedAssets',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'downloadedAssets',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedAssetsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'downloadedAssets',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadedSize',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadedSize',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadedSize',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadedSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadedSizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadedSizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadedSizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadedSizeText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'downloadedSizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'downloadedSizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadedSizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadedSizeText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadedSizeText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      downloadedSizeTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadedSizeText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorMessage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'errorMessage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'failedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'failedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'failedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'failedAssets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'failedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'failedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'failedAssets',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'failedAssets',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'failedAssets',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'failedAssets',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedAssets',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedAssets',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedAssets',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedAssets',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedAssets',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      failedAssetsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'failedAssets',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      isDownloadingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDownloading',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      isFailedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFailed',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      isPausedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPaused',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      isPendingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPending',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      isPremiumContentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPremiumContent',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lastSyncedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lastSyncedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lastSyncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonIds',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lessonIds',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lessonIds',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lessonIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      lessonIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'lessonIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      maxRetriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRetries',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      maxRetriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxRetries',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      maxRetriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxRetries',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      maxRetriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxRetries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      needsSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packageDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packageDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packageDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packageDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packageDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packageDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packageDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packageDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packageName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      packageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressPercentageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressPercentageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progressPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressPercentageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progressPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressPercentageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progressPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progressText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'progressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'progressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'progressText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'progressText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      progressTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'progressText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quizIds',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quizIds',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quizIds',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quizIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'quizIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'quizIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'quizIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'quizIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'quizIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      quizIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'quizIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      retryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      retryCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      retryCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      retryCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'retryCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sizeText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sizeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sizeText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sizeText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      sizeTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sizeText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      statusTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusText',
        value: '',
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topicIds',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'topicIds',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'topicIds',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'topicIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      topicIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topicIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      totalSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSize',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      totalSizeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSize',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      totalSizeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSize',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      totalSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterFilterCondition>
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
}

extension OfflinePackageQueryObject
    on QueryBuilder<OfflinePackage, OfflinePackage, QFilterCondition> {}

extension OfflinePackageQueryLinks
    on QueryBuilder<OfflinePackage, OfflinePackage, QFilterCondition> {}

extension OfflinePackageQuerySortBy
    on QueryBuilder<OfflinePackage, OfflinePackage, QSortBy> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByAutoSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSync', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByAutoSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSync', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByCanRetry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canRetry', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByCanRetryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canRetry', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCompletedAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCompletedAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadDurationText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadDurationText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadDurationTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadDurationText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadProgressText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgressText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadProgressTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgressText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStartedAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStartedAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadedSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedSize', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadedSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedSize', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadedSizeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedSizeText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByDownloadedSizeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedSizeText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsDownloading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloading', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsDownloadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloading', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByIsFailed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFailed', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsFailedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFailed', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByIsPaused() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaused', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsPausedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaused', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByIsPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsPendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsPremiumContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPremiumContent', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByIsPremiumContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPremiumContent', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByMaxRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByMaxRetriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByPackageDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageDescription', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByPackageDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageDescription', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByPackageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByPackageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByProgressPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressPercentage', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByProgressPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressPercentage', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByProgressText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByProgressTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortBySizeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortBySizeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByStatusText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByStatusTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByTotalSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSize', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByTotalSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSize', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension OfflinePackageQuerySortThenBy
    on QueryBuilder<OfflinePackage, OfflinePackage, QSortThenBy> {
  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByAutoSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSync', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByAutoSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoSync', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByCanRetry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canRetry', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByCanRetryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canRetry', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCompletedAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadCompletedAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadDurationText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadDurationText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadDurationTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadDurationText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadProgressText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgressText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadProgressTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadProgressText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStartedAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadStartedAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadedSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedSize', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadedSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedSize', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadedSizeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedSizeText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByDownloadedSizeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadedSizeText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsDownloading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloading', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsDownloadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDownloading', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByIsFailed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFailed', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsFailedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFailed', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByIsPaused() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaused', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsPausedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaused', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByIsPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsPendingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPending', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsPremiumContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPremiumContent', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByIsPremiumContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPremiumContent', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByMaxRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByMaxRetriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRetries', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByPackageDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageDescription', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByPackageDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageDescription', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByPackageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByPackageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByProgressPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressPercentage', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByProgressPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressPercentage', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByProgressText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByProgressTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenBySizeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenBySizeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sizeText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByStatusText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusText', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByStatusTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusText', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByTotalSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSize', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByTotalSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSize', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension OfflinePackageQueryWhereDistinct
    on QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> {
  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByAutoSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoSync');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByCanRetry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canRetry');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByDownloadCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadCompletedAt');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByDownloadDurationText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadDurationText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByDownloadProgressText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadProgressText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByDownloadStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadStartedAt');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByDownloadedAssets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadedAssets');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByDownloadedSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadedSize');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByDownloadedSizeText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadedSizeText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByErrorMessage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByFailedAssets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'failedAssets');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByIsDownloading() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDownloading');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByIsFailed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFailed');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByIsPaused() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPaused');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByIsPending() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPending');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByIsPremiumContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPremiumContent');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByLessonIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lessonIds');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByMaxRetries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRetries');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByPackageDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packageDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByPackageName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packageName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByProgressPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressPercentage');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByProgressText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByQuizIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quizIds');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retryCount');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctBySizeText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sizeText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByStatusText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByTopicIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topicIds');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByTotalSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSize');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<OfflinePackage, OfflinePackage, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension OfflinePackageQueryProperty
    on QueryBuilder<OfflinePackage, OfflinePackage, QQueryProperty> {
  QueryBuilder<OfflinePackage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> autoSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoSync');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> canRetryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canRetry');
    });
  }

  QueryBuilder<OfflinePackage, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OfflinePackage, DateTime?, QQueryOperations>
      downloadCompletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadCompletedAt');
    });
  }

  QueryBuilder<OfflinePackage, String?, QQueryOperations>
      downloadDurationTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadDurationText');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations>
      downloadProgressTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadProgressText');
    });
  }

  QueryBuilder<OfflinePackage, DateTime?, QQueryOperations>
      downloadStartedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadStartedAt');
    });
  }

  QueryBuilder<OfflinePackage, List<String>, QQueryOperations>
      downloadedAssetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadedAssets');
    });
  }

  QueryBuilder<OfflinePackage, int, QQueryOperations> downloadedSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadedSize');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations>
      downloadedSizeTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadedSizeText');
    });
  }

  QueryBuilder<OfflinePackage, String?, QQueryOperations>
      errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<OfflinePackage, List<String>, QQueryOperations>
      failedAssetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'failedAssets');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> isDownloadingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDownloading');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> isFailedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFailed');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> isPausedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPaused');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> isPendingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPending');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations>
      isPremiumContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPremiumContent');
    });
  }

  QueryBuilder<OfflinePackage, DateTime?, QQueryOperations>
      lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<OfflinePackage, List<int>, QQueryOperations>
      lessonIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lessonIds');
    });
  }

  QueryBuilder<OfflinePackage, int, QQueryOperations> maxRetriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRetries');
    });
  }

  QueryBuilder<OfflinePackage, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations>
      packageDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packageDescription');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations> packageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packageName');
    });
  }

  QueryBuilder<OfflinePackage, double, QQueryOperations> progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<OfflinePackage, double, QQueryOperations>
      progressPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressPercentage');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations>
      progressTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressText');
    });
  }

  QueryBuilder<OfflinePackage, List<int>, QQueryOperations> quizIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quizIds');
    });
  }

  QueryBuilder<OfflinePackage, int, QQueryOperations> retryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retryCount');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations> sizeTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sizeText');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<OfflinePackage, String, QQueryOperations> statusTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusText');
    });
  }

  QueryBuilder<OfflinePackage, List<int>, QQueryOperations> topicIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicIds');
    });
  }

  QueryBuilder<OfflinePackage, int, QQueryOperations> totalSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSize');
    });
  }

  QueryBuilder<OfflinePackage, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<OfflinePackage, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
