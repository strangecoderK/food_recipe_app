import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/profile/profile_data_source.dart';
import 'package:food_recipe_app/domain/model/profile.dart';
import 'package:food_recipe_app/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSource;

  const ProfileRepositoryImpl({
    required ProfileDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Result<List<Profile>>> getProfiles() async {
    try {
      final result = await _dataSource.getProfiles();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}
