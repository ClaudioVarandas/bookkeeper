import 'package:flutter/material.dart';
import 'package:bookkeeper/di/dependency_provider.dart';
import 'package:bookkeeper/presentation/app.dart';

void main() async {
  var dependencyProvider = DependencyProvider(child : BookkeeperApp());
  await dependencyProvider.initialize();
  runApp(dependencyProvider);
}
