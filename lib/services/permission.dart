import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialapp/models/user.dart';

class PermissionServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//for user create
  Users _userCreater(User firebaseUser) {
    return firebaseUser == null ? null : Users.madeFromFirebase(firebaseUser);
  }

  //for status
  Stream<Users> get statusFollower {
    return _firebaseAuth.authStateChanges().map(_userCreater);
  }
}
