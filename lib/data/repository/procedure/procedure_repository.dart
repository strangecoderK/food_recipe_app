import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<Result<List<Procedure>>> getProcedures();
}
