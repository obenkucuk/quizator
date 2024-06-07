part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.changeTheme() = ChangeTheme;
  const factory ThemeEvent.changeThemeWith({@Default(ThemeMode.system) ThemeMode themeMode}) =
      ChangeThemeWith;
}
