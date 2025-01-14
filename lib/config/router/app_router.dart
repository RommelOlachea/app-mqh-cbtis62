import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/presentation/authenticate/authenticate.dart';
import '../../presentation/screens/screens.dart';

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
      builder: (context, state) => const LevelsScreen(),
    ),    
    GoRoute(
      name: 'progress',      
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),    
  ],
);

