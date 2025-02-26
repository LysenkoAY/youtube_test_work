import 'package:flutter/cupertino.dart';

class FavoriteGroups {
  FavoriteGroups({this.list});

  List<String>? list;
}

class FavoriteGroupsModel extends InheritedModel<FavoriteGroups> {
  final FavoriteGroups? user;

  const FavoriteGroupsModel({super.key, required super.child, this.user});

  static FavoriteGroups? of(BuildContext context) {
    return InheritedModel.inheritFrom<FavoriteGroupsModel>(context)!.user;
  }

  @override
  bool updateShouldNotify(FavoriteGroupsModel oldWidget) {
    return user != oldWidget.user;
  }

  @override
  bool updateShouldNotifyDependent(FavoriteGroupsModel oldWidget, Set<FavoriteGroups> dependencies) {
    return user != oldWidget.user && dependencies.contains(user);
  }
}
