import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/repositories.dart';

final levelsRepositoryProvider  = Provider((ref) => LevelsRepository());