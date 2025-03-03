import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/presentation/authenticate/authenticate.dart';
import 'package:mqh_rommel/presentation/screens/preferences_screen.dart';
import '../../presentation/screens/screens.dart';
import '../../presentation/screens/topics/topics.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [     
    GoRoute(
      name: 'splashscreen',      
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),    
    GoRoute(
      name: 'login',      
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),    
    GoRoute(
      name: 'register',      
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),    
    GoRoute(
      name: 'forgotpassword',      
      path: '/forgotpassword',
      builder: (context, state) => ForgotPasswordScreen(),
    ),    
    GoRoute(
      name: 'home',      
      path: '/home',
      builder: (context, state) =>  HomeScreen(),
    ),    
    GoRoute(
      name: 'topics',      
      path: '/topics',
      builder: (context, state) =>  TopicsScreen(),
    ),    
    GoRoute(
      name: 'levels',      
      path: '/levels',
      builder: (context, state) => LevelsScreen(),
    ),    
    GoRoute(
      name: 'progress',      
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),    
    GoRoute(
      name: 'alphabet',      
      path: '/alphabet',
      builder: (context, state) =>  AlphabetScreen(),
    ),    
    GoRoute(
      name: 'numbers',      
      path: '/numbers',
      builder: (context, state) =>  NumberScreen(),
    ),    
    GoRoute(
      name: 'developement',      
      path: '/development',
      builder: (context, state) =>  const DevelopmentScreen(),
    ), 
    GoRoute(
      name: 'preferences',      
      path: '/preferences',
      builder: (context, state) =>  PreferencesScreen(),
    ),   
  ],
);

