import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

// ESTADO DE COLORES INMUTABLES
final colorListProvider = Provider((ref) => colorList);

// ESTADO DE TEMA
final isInDarkModeProvider = StateProvider((ref) => false);

// valor seleccionado del tema
final selectedColorProvider = StateProvider((ref) => 0);
