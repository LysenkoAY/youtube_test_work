
import 'package:drift/drift.dart';
import 'package:youtube_test_work/core/database/tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Videos])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

}