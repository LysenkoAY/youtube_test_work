import 'package:flutter/cupertino.dart';

class AppModel {
  AppModel({this.list});
  List<String>? list;
}

class AppInheritedModel extends InheritedModel<AppModel> {
  final AppModel? data;

  const AppInheritedModel({super.key, required super.child, this.data});

  static int countOf(BuildContext context) {
    return InheritedModel.inheritFrom<AppInheritedModel>(context)!.data!.list!.length;
  }

  @override
  bool updateShouldNotify(AppInheritedModel oldWidget) {
    return data != oldWidget.data;
  }

  @override
  bool updateShouldNotifyDependent(AppInheritedModel oldWidget, Set<AppModel> dependencies) {
    return data != oldWidget.data && dependencies.contains(data);
  }
}
