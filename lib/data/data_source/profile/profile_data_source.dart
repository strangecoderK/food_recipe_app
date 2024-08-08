import 'package:food_recipe_app/domain/model/profile.dart';

abstract interface class ProfileDataSource {
  Future<List<Profile>> getProfiles();
}
