import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/presentation/authenticate/authenticate.dart';
import 'package:mqh_rommel/presentation/screens/games/alphabetic_memory_game_screen.dart';
import 'package:mqh_rommel/presentation/screens/games/calendar_memory_game_screen.dart';
import 'package:mqh_rommel/presentation/screens/games/numbers_memory_game.dart';
import 'package:mqh_rommel/presentation/screens/information_screen.dart';
import 'package:mqh_rommel/presentation/screens/profile_photo_screen.dart';
import 'package:mqh_rommel/presentation/screens/profile_screen.dart';
import 'package:mqh_rommel/presentation/screens/quizs/alphabetic_quiz_screen.dart';
import 'package:mqh_rommel/presentation/screens/quizs/dayweeks_quiz_screen.dart';
import 'package:mqh_rommel/presentation/screens/quizs/month_seasons_quiz_screen.dart';
import 'package:mqh_rommel/presentation/screens/quizs/numbersa_squiz_screen.dart';
import 'package:mqh_rommel/presentation/screens/quizs/numbersb_squiz_screen.dart';
import 'package:mqh_rommel/presentation/screens/quizs/prepositions_quiz_screen.dart';
import 'package:mqh_rommel/presentation/screens/quizs/vocales_quiz_screen.dart';
import 'package:mqh_rommel/presentation/screens/topics/instructions_screens.dart';
import 'package:mqh_rommel/presentation/screens/topics/prepositions_screen.dart';
import 'package:mqh_rommel/presentation/screens/topics/questions_screen.dart';
import '../../presentation/screens/about/about.dart';
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
      name: 'profilephoto',      
      path: '/profilephoto',
      builder: (context, state) =>  ProfilePhotoScreen(),
    ),    
    GoRoute(
      name: 'profile',      
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),    
    GoRoute(
      name: 'calendary',      
      path: '/calendary',
      builder: (context, state) =>  CalendaryScreen(),
    ),    
    GoRoute(
      name: 'daysofweek',      
      path: '/daysofweek',
      builder: (context, state) =>  DaysOfWeekScreen(),
    ),    
    GoRoute(
      name: 'months',      
      path: '/months',
      builder: (context, state) =>  MonthsScreen(),
    ),    
    GoRoute(
      name: 'seasons',      
      path: '/seasons',
      builder: (context, state) =>  SeasonsScreen(),
    ), 
    GoRoute(
      name: 'glossary',      
      path: '/glossary',
      builder: (context, state) =>  GlossaryScreen(),
    ),        
    GoRoute(
      name: 'questions',      
      path: '/questions',
      builder: (context, state) =>  QuestionsScreen(),
    ),        
    GoRoute(
      name: 'instructions',      
      path: '/instructions',
      builder: (context, state) =>  InstructionsScreen(),
    ),    
    GoRoute(
      name: 'prepositions',      
      path: '/prepositions',
      builder: (context, state) =>  PrepositionsScreen(),
    ),    

    GoRoute(
      name: 'preferences',      
      path: '/preferences',
      builder: (context, state) =>  const PreferencesScreen(),
    ),    
    GoRoute(
      name: 'privacypolicy',      
      path: '/privacypolicy',
      builder: (context, state) =>  PrivacyPolicyScreen(),
    ),    
    GoRoute(
      name: 'termsofuse',      
      path: '/termsofuse',
      builder: (context, state) =>  const TermsOfUseScreen(),
    ),    
    GoRoute(
      name: 'contact',      
      path: '/contact',
      builder: (context, state) =>  const ContactScreen(),
    ),    
    GoRoute(
      name: 'alphabetquiz',      
      path: '/alphabetquiz',
      builder: (context, state) =>  const AlphabetQuizScreen(),
    ),    
    GoRoute(
      name: 'vocalquiz',      
      path: '/vocalquiz',
      builder: (context, state) =>  const VocalesQuizScreen(),
    ),    
    GoRoute(
      name: 'alphabeticgame',      
      path: '/alphabeticgame',
      builder: (context, state) =>  const AlphabeticMemoryGameScreen(),
    ),    
    GoRoute(
      name: 'numbersaquiz',      
      path: '/numbersaquiz',
      builder: (context, state) =>  const NumbersaSquizScreen(),
    ),    
    GoRoute(
      name: 'numbersbquiz',      
      path: '/numbersbquiz',
      builder: (context, state) =>  const NumbersbSquizScreen(),
    ),    
    GoRoute(
      name: 'numbersgame',      
      path: '/numbersgame',
      builder: (context, state) =>  const NumbersMemoryGameScreen(),
    ),    
    GoRoute(
      name: 'daysweekquiz',      
      path: '/daysweekquiz',
      builder: (context, state) =>  const DaysWeekQuizScreen(),
    ),    
    GoRoute(
      name: 'monthseasonsquiz',      
      path: '/monthseasonsquiz',
      builder: (context, state) =>  const MonthSeasonsQuizScreen(),
    ),    
    GoRoute(
      name: 'calendargame',      
      path: '/calendargame',
      builder: (context, state) =>   const CalendarMemoryGameScreen(),
    ),    
    GoRoute(
      name: 'prepositionsquiz',      
      path: '/prepositionsquiz',
      builder: (context, state) =>   const PrepositionsSquizScreen(),
    ),    
    GoRoute(
      name: 'information',      
      path: '/information',
      builder: (context, state) =>   const InformationScreen(),
    ),    
  ],
);

