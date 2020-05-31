import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/app/app_module.dart';
import 'package:petvac/app/models/gamestatus_model.dart';
import 'package:petvac/app/modules/gamestatus/gamestatus_repository.dart';
import 'package:rxdart/rxdart.dart';

class GameStatusBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<GamestatusRepository>();
  String _documentId;
  String _nome;

  GameStatusBloc() {
    _nomeController.listen((value) => _nome = value);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;
  void setNome(String value) => _nomeController.sink.add(value);

  Observable<List<GameStatus>> get getGameStatus => _repository.getAll;

  void delete(String _documentId) => _repository.delete(_documentId);

  void setGameStatus(GameStatus gameStatus) {
    _documentId = gameStatus.documentId();
    setNome(gameStatus.nome);
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool insertOrUpdate() {
    var _gameStatus = GameStatus()..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(_gameStatus);
    } else {
      _repository.update(_documentId, _gameStatus);
    }

    return true;
  }
}
