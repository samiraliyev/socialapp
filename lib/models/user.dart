import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Users {
  final String id;
  final String userName;
  final String photoUrl;
  final String email;
  final String about;

  Users(
      {@required this.id,
      this.userName,
      this.photoUrl,
      this.email,
      this.about});

  factory Users.madeFromFirebase(User user) {
    return Users(
      id: user.uid,
      userName: user.displayName,
      photoUrl: user.photoURL,
      email: user.email,
    );
  }

  factory Users.madeFromDocument(DocumentSnapshot doc) {
    return Users(
      id: doc.id,
      userName: doc.data()['userName'],
      email: doc.data()['email'],
      photoUrl: doc.data()['photoUrl'],
      about: doc.data()['about'],
    );
  }
}
