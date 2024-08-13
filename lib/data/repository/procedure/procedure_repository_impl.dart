import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/procedure/procedure_data_source.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';
import 'package:food_recipe_app/domain/repository/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _dataSource;

  const ProcedureRepositoryImpl({
    required ProcedureDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Result<List<Procedure>>> getProcedures() async {
    try {
      final result = await _dataSource.getProcedures();
      return Result.success(result);
    } catch (e) {
      return const Result.error('로드에 실패했습니다.');
    }
  }
}
