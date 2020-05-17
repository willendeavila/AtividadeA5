import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petvac/app/models/base_model.dart';

class GameTipos extends BaseModel {
  static const String COLLECTION_NAME = 'GameTipos';
  static const String NOME = "nome";
  String _documentId;
  String nome;

  GameTipos();

  @override
  String documentId() {
    return this._documentId;
  }

  @override
  GameTipos.fromMap(DocumentSnapshot document) {
    this._documentId = document.documentID.toString();

    this.nome = document.data[GameTipos.NOME];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;

    return map;
  }
}
