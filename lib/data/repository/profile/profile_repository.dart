import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/profile.dart';

abstract interface class ProfileRepository {
  Future<Result<List<Profile>>> getProfiles();
}
