import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:petvac/app/modules/gamestatus/gamestatus_bloc.dart';
import 'package:petvac/app/modules/gamestatus/gamestatus_module.dart';

void main() {
  initModule(GamestatusModule());
  GameStatusBloc bloc;

  // setUp(() {
  //     bloc = GamestatusModule.to.bloc<GamestatusBloc>();
  // });

  // group('GamestatusBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<GamestatusBloc>());
  //   });
  // });
}
