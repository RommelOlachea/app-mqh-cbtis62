import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/repositories.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());


