# anguar_fire
Library for Firebase and AngularDart


## Usage

A simple usage example:

```dart
import 'package:angular/angular.dart';
import 'package:angular_fire/angular_fire.dart';

void main() => bootstrap(AppComponent, [
  FirebaseModule(new FirebaseOptions(
    apiKey: "...",
    authDomain: "...",
    databaseURL: "...",
    storageBucket: "..."))
]);

```