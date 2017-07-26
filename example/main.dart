// Copyright (c) 2017, Pablo Cariel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html' show UIEvent;
import 'package:angular/angular.dart';
import 'package:angular/router.dart';
import 'package:angular_fire/angular_fire.dart';
import 'package:firebase/firebase.dart';

void main() => bootstrap(AppComponent, [
  FirebaseModule(new FirebaseOptions(
    apiKey: "...",
    authDomain: "...",
    databaseURL: "...",
    storageBucket: "..."))
]);
@Component(
  selector: 'my-app',
  template: '<h1>Hello {{name}}</h1> <input>',
  providers: const [AngularFireAuth],
  directives: const []
)
class AppComponent implements OnActivate{
  var name = 'Angular';
  final AngularFireAuth _auth;

  AppComponent(this._auth) {
    final user = googleSignIn();
  }

  Future<UserCredential> googleSignIn() async {
    final user = await _auth.auth.signInWithPopup(new PhoneAuthProvider());
    return user;
  }

  @override
  void routerOnActivate(next, prev) {
  }
}