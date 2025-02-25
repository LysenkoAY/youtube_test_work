// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $VideosTable extends Videos with TableInfo<$VideosTable, VideoEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VideosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _videoIdMeta =
      const VerificationMeta('videoId');
  @override
  late final GeneratedColumn<String> videoId = GeneratedColumn<String>(
      'video_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _channelNameMeta =
      const VerificationMeta('channelName');
  @override
  late final GeneratedColumn<String> channelName = GeneratedColumn<String>(
      'channel_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<String> views = GeneratedColumn<String>(
      'views', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _uploadDateMeta =
      const VerificationMeta('uploadDate');
  @override
  late final GeneratedColumn<String> uploadDate = GeneratedColumn<String>(
      'upload_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _searchNameMeta =
      const VerificationMeta('searchName');
  @override
  late final GeneratedColumn<String> searchName = GeneratedColumn<String>(
      'search_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [videoId, title, channelName, views, uploadDate, url, searchName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'videos';
  @override
  VerificationContext validateIntegrity(Insertable<VideoEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('video_id')) {
      context.handle(_videoIdMeta,
          videoId.isAcceptableOrUnknown(data['video_id']!, _videoIdMeta));
    } else if (isInserting) {
      context.missing(_videoIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('channel_name')) {
      context.handle(
          _channelNameMeta,
          channelName.isAcceptableOrUnknown(
              data['channel_name']!, _channelNameMeta));
    } else if (isInserting) {
      context.missing(_channelNameMeta);
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    } else if (isInserting) {
      context.missing(_viewsMeta);
    }
    if (data.containsKey('upload_date')) {
      context.handle(
          _uploadDateMeta,
          uploadDate.isAcceptableOrUnknown(
              data['upload_date']!, _uploadDateMeta));
    } else if (isInserting) {
      context.missing(_uploadDateMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('search_name')) {
      context.handle(
          _searchNameMeta,
          searchName.isAcceptableOrUnknown(
              data['search_name']!, _searchNameMeta));
    } else if (isInserting) {
      context.missing(_searchNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  VideoEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VideoEntry(
      videoId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      channelName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel_name'])!,
      views: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}views'])!,
      uploadDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}upload_date'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      searchName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}search_name'])!,
    );
  }

  @override
  $VideosTable createAlias(String alias) {
    return $VideosTable(attachedDatabase, alias);
  }
}

class VideoEntry extends DataClass implements Insertable<VideoEntry> {
  final String videoId;
  final String title;
  final String channelName;
  final String views;
  final String uploadDate;
  final String url;
  final String searchName;
  const VideoEntry(
      {required this.videoId,
      required this.title,
      required this.channelName,
      required this.views,
      required this.uploadDate,
      required this.url,
      required this.searchName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['video_id'] = Variable<String>(videoId);
    map['title'] = Variable<String>(title);
    map['channel_name'] = Variable<String>(channelName);
    map['views'] = Variable<String>(views);
    map['upload_date'] = Variable<String>(uploadDate);
    map['url'] = Variable<String>(url);
    map['search_name'] = Variable<String>(searchName);
    return map;
  }

  VideosCompanion toCompanion(bool nullToAbsent) {
    return VideosCompanion(
      videoId: Value(videoId),
      title: Value(title),
      channelName: Value(channelName),
      views: Value(views),
      uploadDate: Value(uploadDate),
      url: Value(url),
      searchName: Value(searchName),
    );
  }

  factory VideoEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VideoEntry(
      videoId: serializer.fromJson<String>(json['videoId']),
      title: serializer.fromJson<String>(json['title']),
      channelName: serializer.fromJson<String>(json['channelName']),
      views: serializer.fromJson<String>(json['views']),
      uploadDate: serializer.fromJson<String>(json['uploadDate']),
      url: serializer.fromJson<String>(json['url']),
      searchName: serializer.fromJson<String>(json['searchName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'videoId': serializer.toJson<String>(videoId),
      'title': serializer.toJson<String>(title),
      'channelName': serializer.toJson<String>(channelName),
      'views': serializer.toJson<String>(views),
      'uploadDate': serializer.toJson<String>(uploadDate),
      'url': serializer.toJson<String>(url),
      'searchName': serializer.toJson<String>(searchName),
    };
  }

  VideoEntry copyWith(
          {String? videoId,
          String? title,
          String? channelName,
          String? views,
          String? uploadDate,
          String? url,
          String? searchName}) =>
      VideoEntry(
        videoId: videoId ?? this.videoId,
        title: title ?? this.title,
        channelName: channelName ?? this.channelName,
        views: views ?? this.views,
        uploadDate: uploadDate ?? this.uploadDate,
        url: url ?? this.url,
        searchName: searchName ?? this.searchName,
      );
  VideoEntry copyWithCompanion(VideosCompanion data) {
    return VideoEntry(
      videoId: data.videoId.present ? data.videoId.value : this.videoId,
      title: data.title.present ? data.title.value : this.title,
      channelName:
          data.channelName.present ? data.channelName.value : this.channelName,
      views: data.views.present ? data.views.value : this.views,
      uploadDate:
          data.uploadDate.present ? data.uploadDate.value : this.uploadDate,
      url: data.url.present ? data.url.value : this.url,
      searchName:
          data.searchName.present ? data.searchName.value : this.searchName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VideoEntry(')
          ..write('videoId: $videoId, ')
          ..write('title: $title, ')
          ..write('channelName: $channelName, ')
          ..write('views: $views, ')
          ..write('uploadDate: $uploadDate, ')
          ..write('url: $url, ')
          ..write('searchName: $searchName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      videoId, title, channelName, views, uploadDate, url, searchName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VideoEntry &&
          other.videoId == this.videoId &&
          other.title == this.title &&
          other.channelName == this.channelName &&
          other.views == this.views &&
          other.uploadDate == this.uploadDate &&
          other.url == this.url &&
          other.searchName == this.searchName);
}

class VideosCompanion extends UpdateCompanion<VideoEntry> {
  final Value<String> videoId;
  final Value<String> title;
  final Value<String> channelName;
  final Value<String> views;
  final Value<String> uploadDate;
  final Value<String> url;
  final Value<String> searchName;
  final Value<int> rowid;
  const VideosCompanion({
    this.videoId = const Value.absent(),
    this.title = const Value.absent(),
    this.channelName = const Value.absent(),
    this.views = const Value.absent(),
    this.uploadDate = const Value.absent(),
    this.url = const Value.absent(),
    this.searchName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VideosCompanion.insert({
    required String videoId,
    required String title,
    required String channelName,
    required String views,
    required String uploadDate,
    required String url,
    required String searchName,
    this.rowid = const Value.absent(),
  })  : videoId = Value(videoId),
        title = Value(title),
        channelName = Value(channelName),
        views = Value(views),
        uploadDate = Value(uploadDate),
        url = Value(url),
        searchName = Value(searchName);
  static Insertable<VideoEntry> custom({
    Expression<String>? videoId,
    Expression<String>? title,
    Expression<String>? channelName,
    Expression<String>? views,
    Expression<String>? uploadDate,
    Expression<String>? url,
    Expression<String>? searchName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (videoId != null) 'video_id': videoId,
      if (title != null) 'title': title,
      if (channelName != null) 'channel_name': channelName,
      if (views != null) 'views': views,
      if (uploadDate != null) 'upload_date': uploadDate,
      if (url != null) 'url': url,
      if (searchName != null) 'search_name': searchName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VideosCompanion copyWith(
      {Value<String>? videoId,
      Value<String>? title,
      Value<String>? channelName,
      Value<String>? views,
      Value<String>? uploadDate,
      Value<String>? url,
      Value<String>? searchName,
      Value<int>? rowid}) {
    return VideosCompanion(
      videoId: videoId ?? this.videoId,
      title: title ?? this.title,
      channelName: channelName ?? this.channelName,
      views: views ?? this.views,
      uploadDate: uploadDate ?? this.uploadDate,
      url: url ?? this.url,
      searchName: searchName ?? this.searchName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (videoId.present) {
      map['video_id'] = Variable<String>(videoId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (channelName.present) {
      map['channel_name'] = Variable<String>(channelName.value);
    }
    if (views.present) {
      map['views'] = Variable<String>(views.value);
    }
    if (uploadDate.present) {
      map['upload_date'] = Variable<String>(uploadDate.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (searchName.present) {
      map['search_name'] = Variable<String>(searchName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VideosCompanion(')
          ..write('videoId: $videoId, ')
          ..write('title: $title, ')
          ..write('channelName: $channelName, ')
          ..write('views: $views, ')
          ..write('uploadDate: $uploadDate, ')
          ..write('url: $url, ')
          ..write('searchName: $searchName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VideosTable videos = $VideosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [videos];
}

typedef $$VideosTableCreateCompanionBuilder = VideosCompanion Function({
  required String videoId,
  required String title,
  required String channelName,
  required String views,
  required String uploadDate,
  required String url,
  required String searchName,
  Value<int> rowid,
});
typedef $$VideosTableUpdateCompanionBuilder = VideosCompanion Function({
  Value<String> videoId,
  Value<String> title,
  Value<String> channelName,
  Value<String> views,
  Value<String> uploadDate,
  Value<String> url,
  Value<String> searchName,
  Value<int> rowid,
});

class $$VideosTableFilterComposer
    extends Composer<_$AppDatabase, $VideosTable> {
  $$VideosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploadDate => $composableBuilder(
      column: $table.uploadDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get searchName => $composableBuilder(
      column: $table.searchName, builder: (column) => ColumnFilters(column));
}

class $$VideosTableOrderingComposer
    extends Composer<_$AppDatabase, $VideosTable> {
  $$VideosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploadDate => $composableBuilder(
      column: $table.uploadDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get searchName => $composableBuilder(
      column: $table.searchName, builder: (column) => ColumnOrderings(column));
}

class $$VideosTableAnnotationComposer
    extends Composer<_$AppDatabase, $VideosTable> {
  $$VideosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get videoId =>
      $composableBuilder(column: $table.videoId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => column);

  GeneratedColumn<String> get views =>
      $composableBuilder(column: $table.views, builder: (column) => column);

  GeneratedColumn<String> get uploadDate => $composableBuilder(
      column: $table.uploadDate, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get searchName => $composableBuilder(
      column: $table.searchName, builder: (column) => column);
}

class $$VideosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VideosTable,
    VideoEntry,
    $$VideosTableFilterComposer,
    $$VideosTableOrderingComposer,
    $$VideosTableAnnotationComposer,
    $$VideosTableCreateCompanionBuilder,
    $$VideosTableUpdateCompanionBuilder,
    (VideoEntry, BaseReferences<_$AppDatabase, $VideosTable, VideoEntry>),
    VideoEntry,
    PrefetchHooks Function()> {
  $$VideosTableTableManager(_$AppDatabase db, $VideosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VideosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VideosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VideosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> videoId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> channelName = const Value.absent(),
            Value<String> views = const Value.absent(),
            Value<String> uploadDate = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> searchName = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VideosCompanion(
            videoId: videoId,
            title: title,
            channelName: channelName,
            views: views,
            uploadDate: uploadDate,
            url: url,
            searchName: searchName,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String videoId,
            required String title,
            required String channelName,
            required String views,
            required String uploadDate,
            required String url,
            required String searchName,
            Value<int> rowid = const Value.absent(),
          }) =>
              VideosCompanion.insert(
            videoId: videoId,
            title: title,
            channelName: channelName,
            views: views,
            uploadDate: uploadDate,
            url: url,
            searchName: searchName,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VideosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VideosTable,
    VideoEntry,
    $$VideosTableFilterComposer,
    $$VideosTableOrderingComposer,
    $$VideosTableAnnotationComposer,
    $$VideosTableCreateCompanionBuilder,
    $$VideosTableUpdateCompanionBuilder,
    (VideoEntry, BaseReferences<_$AppDatabase, $VideosTable, VideoEntry>),
    VideoEntry,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VideosTableTableManager get videos =>
      $$VideosTableTableManager(_db, _db.videos);
}
