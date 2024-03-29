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
  String _image;

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
    String image = '',
  })  : _userId = userId,
        _profileImage = profileImage,
        _username = username,
        _firstname = firstName,
        _lastname = lastname,
        _email = email,
        _tel = tel,
        _lineId = lineId,
        _userType = userType,
        _image = image;

  String get userId => _userId;

  String get profileImage => _profileImage;

  String get username => _username;

  String get firstname => _firstname;

  String get lastname => _lastname;

  String get email => _email;

  String get tel => _tel;

  String get lineId => _lineId;

  String get userType => _userType;

  String get image => _image;

  void setProfile(String username, String firstname, String lastname,
      String email, String tel, String lineId) {
    _username = username;
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _tel = tel;
    _lineId = lineId;
    notifyListeners();
  }

  void setPreviewImage(String image) {
    _image = image;
  }

  void setProfileImage(String image) {
    _profileImage = image;
  }

  void setUser(
    String userId,
    String profileImage,
    String username,
    String firstname,
    String lastname,
    String email,
    String tel,
    String lineId,
    String userType,
  ) {
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
    String username,
    String firstname,
    String lastname,
    String email,
    String tel,
    String lineId,
  ) {
    _username = username;
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _tel = tel;
    _lineId = lineId;
    notifyListeners();
  }

  void clearUser() {
    _userId = '';
    _profileImage = '';
    _username = '';
    _firstname = '';
    _lastname = '';
    _email = '';
    _tel = '';
    _lineId = '';
    _userType = '';
    notifyListeners();
  }
}
