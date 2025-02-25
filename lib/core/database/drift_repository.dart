import 'package:drift/native.dart';
import 'package:youtube_scrape_api/models/video.dart';

import 'database.dart';

class DriftRepository {
  final db = AppDatabase(NativeDatabase.memory());

  void insert(Video video, String searchName) {
    db.into(db.videos).insert(
          VideoEntry(
            videoId: video.videoId!,
            title: video.title!,
            channelName: video.channelName!,
            views: video.views!,
            uploadDate: video.uploadDate!,
            url: video.thumbnails![0].url!,
            searchName: searchName,
          ),
        );
  }
  Future<List<VideoEntry>> fetch(String filter) async {
    final query = db.select(db.videos)..where((tbl) => tbl.searchName.equals(filter));
    return await query.get();
  }

  Future<List<String>> getSearchNames() async {
    final query = await db.customSelect('select search_name from videos group by search_name').get();
    List<String> list = [];
    for (final row in query) {
      list.add(row.data['search_name']);
    }
    return list;
  }
  
  void delete(String videoId) {
    db.delete(db.videos).where((table) => table.videoId.equals(videoId));
  }

  Stream<List<VideoEntry>> getAppSettingsStream() => db.select(db.videos).watch();
}
