import 'package:dotorimarket/viewmodels/view_model.dart';
import 'package:flutter/material.dart';

class ViewModelProvider extends InheritedWidget {
  final ViewModel viewModel;

  ViewModelProvider({Key key, Widget child, @required this.viewModel}): super(key: key, child: child);

  @override
  bool updateShouldNotify(ViewModelProvider oldWidget) => this.viewModel != oldWidget.viewModel;

  static T of<T extends ViewModel>(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<ViewModelProvider>()).viewModel;
}