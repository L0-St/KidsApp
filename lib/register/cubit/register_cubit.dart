import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../helpers/api_const.dart';
import '../../helpers/api_helper.dart';
import '../../helpers/hive_helper.dart';
import '../model/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  RegisterModel registerModel = RegisterModel();
  void register({
    required String name,
    required String phone,
    required String email,
    required String password,
  })async
  {
    emit(RegisterLoading());
    try {
      final response =await ApiHelper.instance.postData(path: ApiConst.REGISTER,body: {
        "name" : name,
        "phone" :phone,
        "email":email,
        "password":password,
        "image":"assets/images/others/playtime.png",
      });
      registerModel = RegisterModel.fromJson(response.data);
      if(registerModel.status==true)
      {
        HiveHelper.saveToken(registerModel.data!.token!);
        emit(RegisterSuccess(registerModel.message!));
      }
      else
      {
        emit(RegisterError(registerModel.message!));
      }
    } catch (e) {
      emit(RegisterError("An error occurred"));
    }

  }
}
