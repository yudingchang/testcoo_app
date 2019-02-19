import 'package:shared_preferences/shared_preferences.dart';

class AppState {
  // Your app will use this to know when to display loading spinners.
  bool isLoading;

  String _token;

  // Constructor
  AppState({
    this.isLoading = false
  });

  // A constructor for when the app is loading.
  factory AppState.loading() => new AppState(isLoading: true);

  void setToken(token) {
    this._token = token;
  }

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading}';
  }
}

