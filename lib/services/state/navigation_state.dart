import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../global/enum.dart';

final homeNavigationProvider = StateProvider<Pages>((ref) => Pages.home);
final appBarOpacityProvider = StateProvider<bool>((ref) => false);
