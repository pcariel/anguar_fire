library angular_fire.auth;

import 'dart:async' show StreamController, Future;
import '../app/app.dart' show FirebaseApp;

import 'package:angular/angular.dart' show Injectable, NgZone;
import 'package:firebase/firebase.dart' show Auth, User, App;

@Injectable()
class AngularFireAuth {
  final NgZone _ngZone;
  Auth _auth;
  Auth get auth => _auth;
  StreamController<User> _authState = new StreamController<User>.broadcast();
  StreamController<User> _idToken = new StreamController<User>.broadcast();

  AngularFireAuth(this._ngZone,  App app): _auth = app.auth() {
    _ngZone.runOutsideAngular(() {
      _auth.onAuthStateChanged.listen((user) {
      _ngZone.run(() => _authState.add(user));
    }, onError: _authState.addError, onDone: _authState.close);
    });

    _auth.onIdTokenChanged.listen((user) {
      _idToken.add(user);
    }, onError: _idToken.addError, onDone: _idToken.close);
  }

  Future<Null> signOut() async => await _auth.signOut(); 
}