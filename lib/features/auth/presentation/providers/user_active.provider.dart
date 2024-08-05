import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.entity.dart';

final userActiveProvider = StateProvider<User?>((ref) => null);
