import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/profile/profile_data_source.dart';
import 'package:food_recipe_app/data/model/profile.dart';
import 'package:food_recipe_app/data/repository/profile/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  const ProfileRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Result<List<Profile>>> getProfiles() async {
    try {
      final result = await dataSource.getProfiles();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}
