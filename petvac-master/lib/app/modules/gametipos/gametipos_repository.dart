import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:petvac/app/models/gametipos_model.dart';
import 'package:rxdart/rxdart.dart';

class GametiposRepository extends Disposable {
  CollectionReference _collection =
      Firestore.instance.collection(GameTipos.COLLECTION_NAME);

  void add(GameTipos _gametipos) => _collection.add(_gametipos.toMap());

  void update(String _documentId, GameTipos _gameTipos) =>
      _collection.document(_documentId).updateData(_gameTipos.toMap());

  void delete(String _documentId) => _collection.document(_documentId).delete();

  Observable<List<GameTipos>> get getAll =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<GameTipos>((document) => GameTipos.fromMap(document))
          .toList()));

  Future<GameTipos> getById(String _documentId) async {
    DocumentSnapshot gameTipos = await _collection.document(_documentId).get();

    return GameTipos.fromMap(gameTipos);
  }

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
