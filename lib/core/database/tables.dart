import 'package:drift/drift.dart';

@DataClassName('VideoEntry')
class Videos extends Table {
  TextColumn get videoId => text()();
  TextColumn get title => text()();
  TextColumn get channelName => text()();
  TextColumn get views => text()();
  TextColumn get uploadDate => text()();
  TextColumn get url => text()();
  TextColumn get searchName => text()();
}

