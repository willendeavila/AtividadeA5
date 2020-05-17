import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/app/models/games_model.dart';
import 'package:petvac/app/modules/games/games_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';

class GamesBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<GamesRepository>();
  String _documentId;
  String _nome, _gameTiposId, _plataforma;
  DateTime _dataAtualizacao;

  GamesBloc() {
    _nomeController.listen((value) => _nome = value);
    _gameTiposIdController.listen((value) => _gameTiposId = value);
    _plataformaController.listen((value) => _plataforma = value);
    _dataAtualizacaoController.listen((value) => _dataAtualizacao = value);
  }

  // Nome
  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;
  void setNome(String value) => _nomeController.sink.add(value);

  // PetTiposId
  var _gameTiposIdController = BehaviorSubject<String>();
  Stream<String> get outGameTiposId => _gameTiposIdController.stream;
  String get outGameTiposIdValue => _gameTiposIdController.stream.value;
  void setGameTiposId(String value) => _gameTiposIdController.sink.add(value);

  // Sexo
  var _plataformaController = BehaviorSubject<String>();
  Stream<String> get outPlataforma => _plataformaController.stream;
  String get outPlataformaValue => _plataformaController.stream.value;
  void setPlataforma(String value) => _plataformaController.sink.add(value);

  // DataAtualizacao
  var _dataAtualizacaoController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outDataAtualizacao => _dataAtualizacaoController.stream;
  void setDataAtualizacao(DateTime value) =>
      _dataAtualizacaoController.sink.add(value);

  Observable<List<Games>> get getGames => _repository.getAll;

  void delete(String _documentId) => _repository.delete(_documentId);

  void setGames(Games games) {
    _documentId = games.documentId();
    setNome(games.nome);
    setDataAtualizacao(games.dataAtualizacao);
    setGameTiposId(games.gameTiposId);
    setPlataforma(games.plataforma);
  }

  bool insertOrUpdate() {
    var _games = Games()
      ..nome = _nome
      ..gameTiposId = _gameTiposId
      ..plataforma = _plataforma
      ..dataAtualizacao = _dataAtualizacao;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(_games);
    } else {
      _repository.update(_documentId, _games);
    }

    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
