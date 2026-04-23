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

  Future<dynamic> getAllRequest({required String collectionName}) async {
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection(collectionName);
      QuerySnapshot snapshot = await collectionReference.get();
      final List<Map<String, dynamic>> allData = [];
      for(var doc in snapshot.docs)
      {
        if(doc.exists){
          Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
          if(data != null){
            allData.add(data);
          }
        }
      }
      return allData;
    } catch(e){
      return {'error': 'Some error occurred'};
    }
  }

  Future<Map<String, dynamic>> addRequest({
    required String collectionName,
    required String customId,
    required Map<String, dynamic> data
  }) async{
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection(collectionName);
      await collectionReference.doc(customId).set(data);
      return {'data': 'Success', 'id': customId};
    } catch(e) {
      return {'error': e.toString()};
    }
  }

  Future<String> deleteRequest({required String collectionName, required String docId}) async{
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection(collectionName);
      await collectionReference.doc(docId).delete();
      return 'Success';
    } catch(e){
      return 'Error: $e';
    }
  }

  Future<String> updateRequest({
    required String collectionName,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection(collectionName);
      await collectionReference.doc(docId).update(data);
      return 'Success';
    } catch(e){
      return e.toString();
    }
  }
}