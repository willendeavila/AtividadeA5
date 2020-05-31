import 'package:petvac/app/modules/gamestatus/gamestatus_repository.dart';
import 'package:petvac/app/modules/gamestatus/gamestatus_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class GamestatusModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => GameStatusBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => GamestatusRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<GamestatusModule>.of();
}
