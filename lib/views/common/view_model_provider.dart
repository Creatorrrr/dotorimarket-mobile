import 'package:dotorimarket/viewmodels/view_model.dart';
import 'package:flutter/material.dart';

class ViewModelProvider extends InheritedWidget {
  final Map<String, ViewModel> viewModelMap = {};

  ViewModelProvider({
    Key key,
    @required Widget child,
    @required List<ViewModel> viewModels,
  }): super(key: key, child: child) {
    for(ViewModel viewModel in viewModels) {
      String type = viewModel.runtimeType.toString();
      viewModelMap[type] = viewModel;
    }
  }

  @override
  bool updateShouldNotify(ViewModelProvider oldWidget) {
    bool isSame = true;
    for (MapEntry<String, ViewModel> entry in this.viewModelMap.entries) {
      if (entry.value != oldWidget.viewModelMap[entry.key]) {
        isSame = false;
      }
    }

    return isSame;
  }

  static T of<T extends ViewModel>(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<ViewModelProvider>()).viewModelMap[T.toString()];
}