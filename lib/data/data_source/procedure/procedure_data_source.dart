import 'package:food_recipe_app/domain/model/procedure.dart';

abstract interface class ProcedureDataSource {
  Future<List<Procedure>> getProcedures();
}
