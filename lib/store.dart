import "main.dart";

class _Store {
  BakerState state;
  BakerState init(BakerState state) {
    this.state = state;
    return state;
  }

  BakerState getState() {
    return state;
  }
}

_Store store = _Store();
