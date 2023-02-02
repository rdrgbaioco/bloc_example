import 'package:bloc_example/library.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class InitApplication extends HomeEvent {}

class AddUserToList extends HomeEvent {
  final String name;
  final String email;
  const AddUserToList({
    required this.name,
    required this.email,
  });
}

class RemoveUserFromList extends HomeEvent {
  final int index;
  const RemoveUserFromList({
    required this.index,
  });
}

class ClearUserList extends HomeEvent {}

class ChangeAppTheme extends HomeEvent {
  final ThemeMode themeMode;
  const ChangeAppTheme({
    required this.themeMode,
  });
}