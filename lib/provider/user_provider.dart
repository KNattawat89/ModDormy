import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _userId;
  String _profileImage;
  String _username;
  String _firstname;
  String _lastname;
  String _email;
  String _tel;
  String _lineId;
  String _userType;

  UserProvider({
    String userId = '',
    String profileImage = '',
    String username = '',
    String firstName = '',
    String lastname = '',
    String email = '',
    String tel = '',
    String lineId = '',
    String userType = '',
  })  : _userId = userId,
        _profileImage = profileImage,
        _username = username,
        _firstname = firstName,
        _lastname = lastname,
        _email = email,
        _tel = tel,
        _lineId = lineId,
        _userType = userType;

  String get userId => _userId;

  String get profileImage => _profileImage;

  String get username => _username;

  String get firstname => _firstname;

  String get lastname => _lastname;

  String get email => _email;

  String get tel => _tel;

  String get lineId => _lineId;

  String get userType => _userType;

  void setUser(
      String userId,
      String profileImage,
      String username,
      String firstname,
      String lastname,
      String email,
      String tel,
      String lineId,
      String userType) {
    _userId = userId;
    _profileImage = profileImage;
    _username = username;
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _tel = tel;
    _lineId = lineId;
    _userType = userType;
    notifyListeners();
  }

  void updatedUser(
      String userId,
      String profileImage,
      String username,
      String firstname,
      String lastname,
      String email,
      String tel,
      String lineId,
      String userType) {
    _userId = userId;
    _profileImage = profileImage;
    _username = username;
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _tel = tel;
    _lineId = lineId;
    _userType = userType;
    notifyListeners();
  }
}
