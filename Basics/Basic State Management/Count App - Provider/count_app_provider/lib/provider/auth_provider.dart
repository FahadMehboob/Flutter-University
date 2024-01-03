import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthPtovider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _success = false;

  bool get success => _success;

  setSuccess(bool value) {
    _success = value;
    notifyListeners();
  }

  void login(String email, password) async {
    setLoading(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        setSuccess(true);
        print("Successfully Register");

        setLoading(false);
      } else {
        setSuccess(false);
        print("Register Failed");
        setLoading(false);
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
