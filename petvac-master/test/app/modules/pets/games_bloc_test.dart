import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/modules/games/games_bloc.dart';
import 'package:petvac/app/modules/games/games_module.dart';

void main() {
  initModule(GamesModule());
  GamesBloc bloc;

  // setUp(() {
  //     bloc = PetsModule.to.bloc<PetsBloc>();
  // });

  // group('PetsBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<PetsBloc>());
  //   });
  // });
}
