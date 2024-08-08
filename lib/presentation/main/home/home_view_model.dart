import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/user.dart';

class HomeViewModel with ChangeNotifier {
  final User _user;

  HomeViewModel(this._user);

  User get user => _user;
}
