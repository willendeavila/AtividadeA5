import 'package:petvac/app/modules/gametipos/gametipos_repository.dart';
import 'package:petvac/app/modules/gametipos/gametipos_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class GametiposModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => GameTiposBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => GametiposRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<GametiposModule>.of();
}
