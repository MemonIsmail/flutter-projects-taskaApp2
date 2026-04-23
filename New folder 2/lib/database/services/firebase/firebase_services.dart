import 'package:firebase_auth/firebase_auth.dart';
import 'package:taska_app/database/services/firebase/firebase_client.dart';
import 'package:taska_app/model/user_model.dart';

class FirebaseServices {

  final FirebaseClient _client = FirebaseClient();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static final FirebaseServices _instance = FirebaseServices._private();

  FirebaseServices._private();

  factory FirebaseServices() => _instance;

  Future<String> addUser(UserModel user) async {

    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      final result = await _client.addRequest(
          collection: 'users',
          customId: credential.user!.uid,
          data: user.toJson(user)
      );

      if(result.containsKey('error')){
        return 'Some error occurred';
      }
      else{
        return 'User added Successfully';
      }
    } on FirebaseAuthException catch(e){
      if(e.code == 'channel-error'){
        return 'Please fill in the empty fields';
      }
      else{
        return e.code;
      }
    } catch(e){
      return 'Some error occurred, please try again later..';
    }
  }

  Future<UserModel> login({required String email, required String password}) async {
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      final result = await _client.getRequest(
        collectionName: 'users',
        docId: credential.user!.uid
      );

      if(result.containsKey('error')) {
        throw Exception('Some Error Occurred');
      }
      return UserModel.fromJson(result['data']);
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);
    } catch(e){
      throw Exception('Some error Occurred, please try again later..');
    }
  }
}