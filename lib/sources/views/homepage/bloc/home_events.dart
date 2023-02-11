import 'package:bloc_example/library.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class InitApplication extends HomeEvent {}

class AddUser extends HomeEvent {
  const AddUser({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;
}

class RemoveUser extends HomeEvent {
  const RemoveUser({
    required this.index,
  });

  final int index;
}

class ClearUserList extends HomeEvent {}

class ChangeAppTheme extends HomeEvent {
  const ChangeAppTheme({
    required this.themeMode,
  });

  final ThemeMode themeMode;
}
