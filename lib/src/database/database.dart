library angular_fire.database;

import 'package:angular/angular.dart' show Injectable, Provider;
import 'package:firebase/firebase.dart' show App, Database;

@Injectable()
class AngularFireDatabase {
  Database database;
  AngularFireDatabase(App app): database = app.database();
}


Provider angularFireDatabaseProvider = 
  const Provider(AngularFireDatabase, deps: const [App]);