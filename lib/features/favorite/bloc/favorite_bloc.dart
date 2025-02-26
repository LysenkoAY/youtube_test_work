import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/database/database.dart';
import '../../../core/database/drift_repository.dart';

part 'favorite_state.dart';

part 'favorite_event.dart';

part 'favorite_bloc.freezed.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState.loading()) {
    on<_Initial>(_onInitial);
    on<_Filter>(_onFilter);
    on<_Delete>(_onDelete);

    pagingController = PagingController<int, VideoEntry>(
      getNextPageKey: (state) {
        if (searchingList.value.isNotEmpty) {
          return state.pages == null ? 1 : null;
        } else {
          return null;
        }
      },
      fetchPage: (pageKey) async => await drift.fetch(searchingList.value[searchIndex]),
    );

    tableStream = drift.getAppSettingsStream();
    tableStream.listen((value) async {
      pagingController.refresh();
      searchingList.value = await drift.getSearchNames();
    });
  }

  late final PagingController<int, VideoEntry> pagingController;

  final DriftRepository drift = GetIt.instance.get<DriftRepository>();

  late final Stream<List<VideoEntry>> tableStream;

  ValueNotifier<List<String>> searchingList = ValueNotifier<List<String>>([]);

  int searchIndex = 0;

  void _onInitial(_Initial event, Emitter<FavoriteState> emit) async {
    emit(FavoriteState.loaded(pagingController: pagingController, searchingList: searchingList));
  }

  void _onFilter(_Filter event, Emitter<FavoriteState> emit) async {
    searchIndex = event.filter;
    pagingController.refresh();
  }

  void _onDelete(_Delete event, Emitter<FavoriteState> emit) async {
    await drift.delete(event.video.videoId);
    pagingController.refresh();
  }
}
