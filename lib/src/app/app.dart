library angular_fire.app;

import 'package:angular/angular.dart'
    show OpaqueToken, Inject, Provider, Injectable, Optional;
import 'package:firebase/firebase.dart'
    show initializeApp, FirebaseJsNotLoadedException, app, FirebaseOptions, App;

/* Old Version
https://github.com/oauth-io/oauth-js/blob/master/coffee/lib/oauth.coffee */

const OpaqueToken firebaseAppConfigToken =
    const OpaqueToken("firebaseAppConfigToken");
const OpaqueToken firebaseAppName = const OpaqueToken("FirebaseAppName");

App firebaseAppFactory(@Inject(firebaseAppConfigToken) FirebaseOptions config,
    @Inject(firebaseAppName) @Optional() String appName) {
  try {
    return initializeApp(
        apiKey: config.apiKey,
        authDomain: config.authDomain,
        databaseURL: config.databaseURL,
        storageBucket: config.storageBucket,
        name: appName);
  } on FirebaseJsNotLoadedException catch (e) {
    print("Error: Load Library firebase");
  } catch (e) {
    return app(appName);
  }
  return app(null);
}

List<Provider> FirebaseModule(FirebaseOptions config, [String appName]) => [
      const Provider(App,
          useFactory: firebaseAppFactory,
          deps: const [firebaseAppConfigToken, firebaseAppName]),
      new Provider(firebaseAppConfigToken, useValue: config),
      new Provider(firebaseAppName, useValue: appName),
    ];
