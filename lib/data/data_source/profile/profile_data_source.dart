import 'package:food_recipe_app/data/model/profile.dart';

abstract interface class ProfileDataSource {
  Future<List<Profile>> getProfiles();
}
