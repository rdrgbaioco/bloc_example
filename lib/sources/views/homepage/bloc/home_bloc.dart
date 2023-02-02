import 'package:bloc_example/library.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {

    on<ChangeAppTheme>(_onChangeAppTheme);

    on<AddUserToList>(_onAddUserToList, transformer: droppable());

    on<RemoveUserFromList>(_onRemoveUserFromList, transformer: droppable());

    on<ClearUserList>(_onClearUserList);
  }

  void _onChangeAppTheme(ChangeAppTheme event, Emitter<HomeState> emit) {
    emit(state.copyWith(themeMode: event.themeMode));
  }

  void _onAddUserToList(AddUserToList event, Emitter<HomeState> emit) {
    final user = User(
      name: event.name,
      email: event.email,
    );
    emit(state.copyWith(users: [...state.users, user]));
  }

  void _onRemoveUserFromList(RemoveUserFromList event, Emitter<HomeState> emit) {
    final users = state.users;
    users.removeAt(event.index);
    emit(state.copyWith(users: users));
  }

  void _onClearUserList(ClearUserList event, Emitter<HomeState> emit) {
    emit(state.copyWith(users: []));
  }

}