import 'package:bloc_example/library.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {

    on<ChangeAppTheme>(_onChangeAppTheme);

    on<AddUser>(_onAddUser, transformer: droppable());

    on<RemoveUser>(_onRemoveUser, transformer: droppable());

    on<ClearUserList>(_onClearUserList);
  }

  void _onChangeAppTheme(ChangeAppTheme event, Emitter<HomeState> emit) {
    emit(state.copyWith(themeMode: event.themeMode));
  }

  void _onAddUser(AddUser event, Emitter<HomeState> emit) {
    final user = User(
      name: event.name,
      email: event.email,
    );
    emit(state.copyWith(users: [...state.users, user]));
  }

  void _onRemoveUser(RemoveUser event, Emitter<HomeState> emit) {
    emit(state.copyWith(users: state.users..removeAt(event.index)));
  }

  void _onClearUserList(ClearUserList event, Emitter<HomeState> emit) {
    emit(state.copyWith(users: []));
  }
}
