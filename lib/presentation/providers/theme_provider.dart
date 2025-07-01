
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider(
  <bool>(ref) => false
);

// Listado de colores inmutables ( nunca van a cambiar)

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);


final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
  );




//Puedo trabajar como arriba si me es más facil

class ThemeNotifier extends StateNotifier <AppTheme> {
  //
  //State = Estado de AppTheme (crea una instancia del AppTheme)
  ThemeNotifier(): super (AppTheme());

  void toggleDarkmode(){
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex (int colorIndex) {
    state = state.copyWith(selectedColor:colorIndex );
  }

}