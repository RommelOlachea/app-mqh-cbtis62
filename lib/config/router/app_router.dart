import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/presentation/authenticate/authenticate.dart';
import 'package:mqh_rommel/presentation/screens/demo_screen.dart';
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
      name: 'demo',      
      path: '/demo',
      builder: (context, state) => const DemoScreen(),
    ),    

  ],
);
