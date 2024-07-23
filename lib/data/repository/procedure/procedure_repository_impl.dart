import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/procedure/procedure_data_source.dart';
import 'package:food_recipe_app/data/model/procedure.dart';
import 'package:food_recipe_app/data/repository/procedure/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource dataSource;

  const ProcedureRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Result<List<Procedure>>> getProcedures() async {
    try {
      final result = await dataSource.getProcedures();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}
