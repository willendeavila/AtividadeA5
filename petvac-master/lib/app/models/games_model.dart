import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petvac/app/models/base_model.dart';

class Games extends BaseModel {
  static const String COLLECTION_NAME = 'Games';
  static const String NOME = "nome",
      DATA_ATUALIZACAO = "data_atualizacao",
      GAMETIPOS_ID = "gametipos_id",
      PLATAFORMA = "plataforma";
  String _documentId;
  String nome, gameTiposId, plataforma;
  DateTime dataAtualizacao;

  Games();

  @override
  String documentId() {
    return this._documentId;
  }

  @override
  Games.fromMap(DocumentSnapshot document) {
    this._documentId = document.documentID.toString();

    this.nome = document.data[Games.NOME];
    Timestamp ts = document.data[Games.DATA_ATUALIZACAO];
    this.dataAtualizacao =
        DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch);
    this.gameTiposId = document.data[Games.GAMETIPOS_ID];
    this.plataforma = document.data[Games.PLATAFORMA];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map[Games.NOME] = this.nome;
    map[Games.DATA_ATUALIZACAO] = this.dataAtualizacao;
    map[Games.GAMETIPOS_ID] = this.gameTiposId;
    map[Games.PLATAFORMA] = this.plataforma;

    return map;
  }
}
