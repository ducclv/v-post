import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldCubit extends Cubit<bool> {
  bool _hasShowPassword = false;

  TextFieldCubit() : super(false);

  void toggleIconPassword() {
    _hasShowPassword = !_hasShowPassword;
    emit(_hasShowPassword);
  }
}
