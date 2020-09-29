import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

///Use this provider to get current provided file, without listening for changes
///
/// Very handy to provide dependencies quickly for store, actions or smth
class StaticProvider {
  static T of<T>(BuildContext context) =>
      Provider.of<T>(context, listen: false);
}

/// [T] Is Store that you are providing, and [U] is observable
class StoreProvider<T extends BaseStore, U> extends StatelessWidget {
  final Widget child;
  final T Function(BuildContext) store;

  const StoreProvider({
    @required this.child,
    @required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: child,
      providers: [
        Provider<T>(
            create: store, dispose: (context, store) => store.dispose()),
        StreamProvider<U>(
          create: (context) =>
              StaticProvider.of<T>(context).o$[U] as BehaviorSubject<U>,
        )
      ],
    );
  }
}

/// [T] Is Store that you are providing, and [U] and [I] are observables
class StoreProvider2<T extends BaseStore, U, I> extends StatelessWidget {
  final Widget child;
  final T Function(BuildContext) storeBuilder;

  const StoreProvider2({
    @required this.child,
    @required this.storeBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: child,
      providers: [
        Provider<T>(
            create: storeBuilder, dispose: (context, store) => store.dispose()),
        StreamProvider<U>(
          create: (context) =>
              StaticProvider.of<T>(context).o$[U] as BehaviorSubject<U>,
        ),
        StreamProvider<I>(
          create: (context) =>
              StaticProvider.of<T>(context).o$[I] as BehaviorSubject<I>,
        ),
      ],
    );
  }
}

abstract class BaseStore {
  Map<Type, BehaviorSubject> get o$;

  List<StreamSubscription> _listeners = [];

  /// Listen to stream, and automatically handle listeners once the store is
  /// disposed
  void listen<P>(Subject<P> stream, Function(P) callback) {
    _listeners.add(stream.listen(callback));
  }

  ///add stuff to stream. type inherence should work
  void add<T>(T event) => o$[T].add(event);

  void dispose() {
    o$.forEach((key, value) {
      value.close();
    });
    _listeners.forEach((element) {
      element.cancel();
    });
  }
}

abstract class Store<T> extends BaseStore {
  Map<Type, BehaviorSubject> _observables$ = {T: BehaviorSubject<T>()};

  @override
  Map<Type, BehaviorSubject> get o$ => _observables$;
}

abstract class Store2<T, U> extends BaseStore {
  Map<Type, BehaviorSubject> _o$ = {
    T: BehaviorSubject<T>(),
    U: BehaviorSubject<U>()
  };

  @override
  Map<Type, BehaviorSubject> get o$ => _o$;
}
