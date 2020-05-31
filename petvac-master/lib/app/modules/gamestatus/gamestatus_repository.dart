import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:petvac/app/models/gamestatus_model.dart';
import 'package:rxdart/rxdart.dart';

class GamestatusRepository extends Disposable {
  CollectionReference _collection =
      Firestore.instance.collection(GameStatus.COLLECTION_NAME);

  void add(GameStatus _gamestatus) => _collection.add(_gamestatus.toMap());

  void update(String _documentId, GameStatus _gameStatus) =>
      _collection.document(_documentId).updateData(_gameStatus.toMap());

  void delete(String _documentId) => _collection.document(_documentId).delete();

  Observable<List<GameStatus>> get getAll =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<GameStatus>((document) => GameStatus.fromMap(document))
          .toList()));

  Future<GameStatus> getById(String _documentId) async {
    DocumentSnapshot gameStatus = await _collection.document(_documentId).get();

    return GameStatus.fromMap(gameStatus);
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
