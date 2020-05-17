import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:petvac/app/models/games_model.dart';
import 'package:rxdart/rxdart.dart';

class GamesRepository extends Disposable {
  CollectionReference _collection =
      Firestore.instance.collection(Games.COLLECTION_NAME);

  void add(Games _games) => _collection.add(_games.toMap());

  void update(String _documentId, Games _games) =>
      _collection.document(_documentId).updateData(_games.toMap());

  void delete(String _documentId) => _collection.document(_documentId).delete();

  Observable<List<Games>> get getAll =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Games>((document) => Games.fromMap(document))
          .toList()));

  Future<Games> getById(String _documentId) async {
    DocumentSnapshot _games = await _collection.document(_documentId).get();

    return Games.fromMap(_games);
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
