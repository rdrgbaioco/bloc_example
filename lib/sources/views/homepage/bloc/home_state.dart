import 'package:bloc_example/library.dart';

class HomeState {
  final List<User> users;
  final ThemeMode themeMode;

  const HomeState({
    required this.users,
    required this.themeMode,
  });


  HomeState copyWith({
    List<User>? users,
    ThemeMode? themeMode,
  }) {
    return HomeState(
      users: users ?? this.users,
        themeMode: themeMode ?? this.themeMode,
    );
  }
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(
    users: const [],
    themeMode: ThemeMode.light,
  );
}