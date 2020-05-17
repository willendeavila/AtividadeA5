import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/app/app_module.dart';
import 'package:petvac/app/models/gametipos_model.dart';
import 'package:petvac/app/modules/gametipos/gametipos_repository.dart';
import 'package:rxdart/rxdart.dart';

class GameTiposBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<GametiposRepository>();
  String _documentId;
  String _nome;

  GameTiposBloc() {
    _nomeController.listen((value) => _nome = value);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;
  void setNome(String value) => _nomeController.sink.add(value);

  Observable<List<GameTipos>> get getGameTipos => _repository.getAll;

  void delete(String _documentId) => _repository.delete(_documentId);

  void setGameTipos(GameTipos gameTipos) {
    _documentId = gameTipos.documentId();
    setNome(gameTipos.nome);
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool insertOrUpdate() {
    var _gameTipos = GameTipos()..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(_gameTipos);
    } else {
      _repository.update(_documentId, _gameTipos);
    }

    return true;
  }
}
