import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/app_theme_settings.dart';
import '../../models/front_or_back_side.dart';
import '../../persistence/hive_data_store.dart';

class AppThemeManager extends StateNotifier<AppThemeSettings> {
  AppThemeManager({
    required AppThemeSettings themeSettings,
    required this.dataStore,
    required this.side,
  }) : super(themeSettings);
  final HiveDataStore dataStore;
  final FrontOrBackSide side;

  void updateColorIndex(int colorIndex) {
    state = state.copyWith(colorIndex: colorIndex);
    dataStore.setAppThemeSettings(settings: state, side: side);
  }

  void updateVariantIndex(int variantIndex) {
    state = state.copyWith(variantIndex: variantIndex);
    dataStore.setAppThemeSettings(settings: state, side: side);
  }
}

final appThemeManagerProvider =
    StateNotifierProvider<AppThemeManager, AppThemeSettings>((ref) {
  throw UnimplementedError();
});
