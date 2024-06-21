import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Pages
import './pages/splash_page.dart';
import './pages/login_page.dart';
import './pages/home_page.dart';
import './pages/register_page.dart';

//Services
import './services/navigation_service.dart';

//Providers
import './providers/authentication_provider.dart';

void main() async{
  runApp(SplashPage(key: UniqueKey(), 
                    onInitializationComplete: (){
                      runApp(MainApp());
                    }),);
}

class MainApp extends StatelessWidget {

  @override
  Widget build (BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(create: (BuildContext _context) {
          return AuthenticationProvider();
        })
      ],
      child: MaterialApp(
        title: 'Convo Flow',
        theme: ThemeData(
          dialogBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),)
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _context) => LoginPage(),
          '/home': (BuildContext _context) => HomePage(),
          '/register': (BuildContext _context) => RegisterPage(),
        },
      ),
    );
  }
}