import 'package:petvac/app/modules/games/games_repository.dart';
import 'package:petvac/app/modules/games/games_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class GamesModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => GamesBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => GamesRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<GamesModule>.of();
}
