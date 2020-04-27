import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';

class InitializeSubscriptions{
  InitializeSubscriptions();
  final Database _db = Database();
  final uid = Auth().getUID();
  var user;
  void getUserData(){
    user = Database().getUserData(user: uid);
  }
}