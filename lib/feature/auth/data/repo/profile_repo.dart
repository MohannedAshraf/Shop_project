import 'package:dartz/dartz.dart';
import 'package:ntigradproject/core/network/api_helper.dart';
import 'package:ntigradproject/core/network/api_response.dart';
import 'package:ntigradproject/core/network/end_points.dart';
import 'package:ntigradproject/feature/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  ProfileRepo._internal();
  static final ProfileRepo _instance = ProfileRepo._internal();
  factory ProfileRepo() => _instance;

  APIHelper dio = APIHelper();

  Future<Either<String, String?>> register({
    required String username,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      ApiResponse response = await dio.postRequest(
        endPoint: EndPoints.register,
        data: {
          "name": username,
          "password": password,
          "email": email,
          "phone": phone,
        },
        isAuthorized: false,
      );
      if (response.status) {
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, String?>> refresh({required String token}) async {
    try {
      ApiResponse response = await dio.putRequest(
        endPoint: EndPoints.refreshtoken,
        data: {"access_token": token},
        isAuthorized: true,
      );
      if (response.status) {
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, String?>> update({
    required String username,
    required String phone,
  }) async {
    try {
      ApiResponse response = await dio.putRequest(
        endPoint: EndPoints.update,
        data: {"name": username, "phone": phone},
        isAuthorized: true,
      );
      if (response.status) {
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  UserModel? userModel;

  get context => null;

  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      ApiResponse response = await dio.postRequest(
        endPoint: EndPoints.login,
        data: {"email": email, "password": password},
        isAuthorized: false,
      );
      if (response.status) {
        // success
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
          response.data,
        );
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', loginResponseModel.accessToken!);
        await prefs.setString(
          'refresh_token',
          loginResponseModel.refreshToken!,
        );
        // save tokens
        //loginResponseModel.accessToken
        userModel = loginResponseModel.user!;
        return Right(userModel!);
      } else {
        // error
        return Left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }
}
