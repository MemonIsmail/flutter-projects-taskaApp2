import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseClient {

  FirebaseClient._internal();

  static final FirebaseClient _instance = FirebaseClient._internal();

  factory FirebaseClient() => _instance;

  Future<Map<String, dynamic>> getRequest({required String collectionName, required String docId}) async {
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection(collectionName);
      DocumentSnapshot snapshot = await collectionReference.doc(docId).get();
      if(snapshot.exists) {
        return {'data': snapshot.data()};
      }
      else{
        return {'error': 'Document does not exist'};
      }
    } catch(e){
      return {'error': 'Some error occurred'};
    }
  }

  Future<Map<String, dynamic>> addRequest({
    required String collection,
    required String customId,
    required Map<String, dynamic> data
  }) async{
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection(collection);
      await collectionReference.doc(customId).set(data);
      return {'data': 'Success', 'id': customId};
    } catch(e) {
      return {'error': e.toString()};
    }
  }
}