import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../helpers/api_const.dart';
import '../../../helpers/api_helper.dart';
import '../../helpers/hive_helper.dart';
import '../model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel loginModel = LoginModel();

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final response = await ApiHelper.instance.postData(
        path: ApiConst.LOGIN,
        body: {
          "email": email,
          "password": password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        HiveHelper.saveToken(loginModel.data!.token!);
        print("===================" + HiveHelper.getToken.toString());
        emit(LoginSuccess(loginModel.message!));
      } else {
        emit(LoginError(loginModel.message!));
      }
    } catch (e) {
      print(e);
      emit(LoginError("An error occurred"));
    }
  }
}
//