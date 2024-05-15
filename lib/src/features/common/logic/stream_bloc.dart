import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StreamCubit<T, D> extends Cubit<T> {
  StreamCubit(T initialState) : super(initialState) {
    initialize();
  }
  Stream<D>? get getStream;

  StreamSubscription? get streamSubscription => _streamSubscription;

  StreamSubscription? _streamSubscription;

  bool get isPaused => _streamSubscription?.isPaused ?? false;

  void initialize() {
    _streamSubscription = getStream?.listen(
      (incomingData) {
        var data = transformData(incomingData);
        onStreamData(data);
      },
      onError: (error) {
        onStreamError(error);
      },
    );
  }

  void onSourceChange() {
    // Disable current stream
    _streamSubscription?.cancel();
    _streamSubscription = null;
    if (getStream != null) {
      initialize();
    }
  }

  void pause() => _streamSubscription?.pause();

  void resume() => _streamSubscription?.resume();

  /// Called before the notifyListeners is called when data has been set
  void onStreamData(D? data);

  /// Called when an error is fired in the stream
  void onStreamError(error);

  /// Called before the data is set for the ViewModel
  D transformData(D data) {
    return data;
  }

  @override
  Future<void> close() async {
    _streamSubscription!.cancel();
    super.close();
  }
}
