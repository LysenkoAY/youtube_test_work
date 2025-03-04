import 'package:flutter/cupertino.dart';

class AppModel {
  AppModel({required this.list});

  late final List<String>? list;
}

class AppInheritedModel extends InheritedModel<bool> {
  final AppModel data;
  late final List<String>? list;

  AppInheritedModel({super.key, required super.child, required this.data}) {
    list = data.list;
  }

  final ValueNotifier<String> notifyDelete = ValueNotifier<String>('');

  static AppInheritedModel? of(BuildContext context) {
    return InheritedModel.inheritFrom<AppInheritedModel>(context);
  }

  static List<String>? listOf(BuildContext context) {
    return InheritedModel.inheritFrom<AppInheritedModel>(context)?.list!;
  }

  static int countOf(BuildContext context) {
    return InheritedModel.inheritFrom<AppInheritedModel>(context)!.data!.list!.length;
  }

  static ValueNotifier<String>? notify(BuildContext context) {
    return InheritedModel.inheritFrom<AppInheritedModel>(context)?.notifyDelete;
  }

  @override
  bool updateShouldNotify(AppInheritedModel oldWidget) {
    return data != oldWidget.data;
  }

  @override
  bool updateShouldNotifyDependent(AppInheritedModel oldWidget, Set<bool> dependencies) {
    return data != oldWidget.data && dependencies.contains(true);
  }
}
