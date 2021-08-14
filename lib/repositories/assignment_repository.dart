import 'package:staffer/models/models.dart';
import 'package:staffer/constants/string.dart';
import 'auth.dart';

abstract class AssignmentRepository {
  Future<List<Assignment>> getAssignments();
}

class AssignmentRepositoryImpl implements AssignmentRepository {
  @override
  Future<List<Assignment>> getAssignments() async {
    Auth auth = Auth();
    var response = auth.getData(AppStrings.activeAssignments);
    List<Assignment> assignment = Assignment.fromJson(response) as List;
    return assignment;
  }
}
