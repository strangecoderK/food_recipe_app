import 'package:food_recipe_app/data/model/procedure.dart';

abstract interface class ProcedureDataSource {
  Future<List<Procedure>> getProcedures();
}
