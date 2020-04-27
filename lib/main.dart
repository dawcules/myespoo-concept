import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import './router.dart';
import 'current_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
   @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final _auth = Auth();

  @override
  void dispose() {
    _auth.disposeAuth();
    super.dispose();
  }
    @override
  void initState() {
    _auth.initAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => _auth.getAuthBloc()),
      ],
      child: MaterialApp(
      title: 'My Espoo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) => Router.generateRoute(settings),
      localeResolutionCallback: (deviceLocale, _) {
        _initLanguage(deviceLocale.toLanguageTag());
        return Locale("en");
      }
    ));
  }

  void _initLanguage(String localeId) {
    print(localeId);
    CurrentLanguage.setNewFromString(localeId);
  }
}