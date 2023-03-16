import 'package:bloc/bloc.dart';

class ThemeBloc extends Cubit<bool> {
  bool init;

  ThemeBloc({this.init = true}) : super(init);

  void changeTheme() => emit(!state);

  @override
  void onChange(Change<bool> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
