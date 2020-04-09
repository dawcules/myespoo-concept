
class Database {
  Database._internal();  
  static final Database _instance = Database._internal();
    factory Database() => _instance;
}