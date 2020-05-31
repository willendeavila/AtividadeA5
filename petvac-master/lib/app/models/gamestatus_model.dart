import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petvac/app/models/base_model.dart';

class GameStatus extends BaseModel {
  static const String COLLECTION_NAME = 'GameStatus';
  static const String NOME = "nome";
  String _documentId;
  String nome;

  GameStatus();

  @override
  String documentId() {
    return this._documentId;
  }

  @override
  GameStatus.fromMap(DocumentSnapshot document) {
    this._documentId = document.documentID.toString();

    this.nome = document.data[GameStatus.NOME];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;

    return map;
  }
}
