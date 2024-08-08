import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/profile.dart';

abstract interface class ProfileRepository {
  Future<Result<List<Profile>>> getProfiles();
}
