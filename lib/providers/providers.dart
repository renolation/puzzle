import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/enums.dart';

final homeScreenTypeProvider = StateProvider<HomeScreenState>((ref) => HomeScreenState.main);
