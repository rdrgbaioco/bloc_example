import 'package:bloc_example/library.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  group('Basic Test a Home BloC', () {
    blocTest<HomeBloc, HomeState>(
      'Test emits 3 new user',
      build: HomeBloc.new,
      act: (bloc) => bloc.add(
        const AddUser(email: 'test0@test', name: 'test0'),
      ),
      expect: () => [
        isA<HomeState>().having((state) => state.users.length, 'has length', 1),
      ],
    );
  });

}
