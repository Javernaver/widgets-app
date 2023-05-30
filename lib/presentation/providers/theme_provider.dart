import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

// ESTADO DE COLORES INMUTABLES
final colorListProvider = Provider((ref) => colorList);

// ESTADO DE TEMA
final isInDarkModeProvider = StateProvider((ref) => false);

// valor seleccionado del tema
final selectedColorProvider = StateProvider((ref) => 0);

// UN Objeto de tip AppTheme (custom)

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o Notifier del tema lo administra el StateNotifierProvider
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void updateTheme(AppTheme newTheme) {
    state = newTheme;
  }

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
