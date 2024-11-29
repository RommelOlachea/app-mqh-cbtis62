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
      name: 'home',      
      path: '/home',
      builder: (context, state) =>  HomeScreen(),
    ),    
    GoRoute(
      name: 'topics',      
      path: '/topics',
      builder: (context, state) => const TopicsScreen(),
    ),    
    GoRoute(
      name: 'levesl',      
      path: '/levels',
      builder: (context, state) => const TopicsScreen(),
    ),    
    GoRoute(
      name: 'progress',      
      path: '/progress',
      builder: (context, state) => const TopicsScreen(),
    ),    
  ],
);

