import 'dart:convert';
import 'dart:developer';
import 'package:flutter_base/core/resource/network/rest_client.dart';
import 'package:flutter_base/core/resource/repositories/repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/features/movie/model/detail_movie_model.dart';
import 'package:flutter_base/features/movie/model/movie_model.dart';
import 'package:flutter_base/features/movie/model/review_model_response.dart';

class Repository implements RepositoryInterface {
  final RestClient _rest;
  const Repository(this._rest);

  @override
  Future<MovieModelResponse> getMovie({required String apikey, required String type}) async {
    try {
      final _response = await _rest.getMovieNowPlaying(apikey, type);
      return _response;
    } on DioError catch (e) {
      return MovieModelResponse();
    } catch (e) {
      return MovieModelResponse();
    }
  }

  @override
  Future<DetailMovieResponse> getMovieDetail({required String apikey, required int movie_id}) async {
    try {
      final _response = await _rest.getMovieDetail(apikey, movie_id);
      return _response;
    } on DioError catch (e) {
      return DetailMovieResponse();
    } catch (e) {
      return DetailMovieResponse();
    }
  }

  @override
  Future<ReviewModelResponse> getReviewMovieDetail({required String apikey, required int movie_id}) async {
    try {
      final _response = await _rest.getReviewMovieDetail(apikey, movie_id);
      log("Response review ${_response.toJson()}");
      return _response;
    } on DioError catch (e) {
      log("Response review dio error ${e}");

      return ReviewModelResponse();
    } catch (e) {
      log("Response review e ${e}");

      return ReviewModelResponse();
    }
  }
}

  // @override
  // Future<CountriesResponse> getCountry() async {
  //   try {
  //     final _response = await _rest.getCountries();
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');
  //     return CountriesResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     return CountriesResponse(message: e.response?.data['message'] ?? e.message, success: false, messageCode: e.response?.data['messageCode']);
  //   } catch (e) {
  //     return CountriesResponse(success: false, message: e.toString());
  //   }
  // }

  // @override
  // Future<TranslatorResponse> getTranslator(String filter) async {
  //   try {
  //     final _response = await _rest.getTranslator(filter);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');
  //     return TranslatorResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     return TranslatorResponse(message: e.response?.data['message'] ?? e.message, success: false, messageCode: e.response?.data['messageCode']);
  //   } catch (e) {
  //     return TranslatorResponse(success: false, message: e.toString());
  //   }
  // }

  // @override
  // Future<LoginResponse> doLogin({required String mobileNumber, required String email, required String requestTime}) async {
  //   try {
  //     final _requestData = LoginRequest(mobile_number: mobileNumber, email: email, request_time: requestTime);
  //     final _response = await _rest.doLogin(_requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');
  //     return LoginResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     return LoginResponse(message: e.response?.data['message'] ?? e.message, success: false, messageCode: e.response?.data['messageCode']);
  //   } catch (e) {
  //     return LoginResponse(success: false, message: e.toString());
  //   }
  // }

  // @override
  // Future<LoginVerifcationResponse> doLoginVerification({
  //   required String otp,
  //   required String deviceId,
  //   required String brand,
  //   required String osType,
  //   required String osVersion,
  // }) async {
  //   try {
  //     final userId = await storage.getUserId;
  //     final _requestData = LoginVerifcationRequest(
  //       user_id: userId,
  //       otp: otp,
  //       device_id: deviceId,
  //       brand: brand,
  //       os_type: osType,
  //       os_version: osVersion,
  //     );
  //     final _response = await _rest.doLoginVerification(_requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return LoginVerifcationResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     return LoginVerifcationResponse(message: e.response?.data['message'] ?? e.message, success: false, messageCode: e.response?.data['messageCode']);
  //   } catch (e) {
  //     return LoginVerifcationResponse(success: false, message: e.toString());
  //   }
  // }

  // @override
  // Future<GeneralResponse> doUpdateTnc({required String tncDate, required String token}) async {
  //   try {
  //     final _requestData = TncRequest(tnc_date: tncDate);
  //     final _response = await _rest.doUpdateTnc(token, _requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return GeneralResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     return GeneralResponse(success: false, message: e.message);
  //   } catch (e) {
  //     return GeneralResponse(success: false, message: e.toString());
  //   }
  // }

  // @override
  // Future<RegisterResponse> doRegister({
  //   required String mobileNumber,
  //   required String tncDate,
  //   required String email,
  //   required String citizen,
  //   required String fullName,
  //   required String nik,
  //   required String bornDate,
  //   required String passportNumber,
  //   required String requestTime,
  //   required String countryCode,
  // }) async {
  //   try {
  //     final _requestData = RegisterRequest(
  //       mobile_number: mobileNumber,
  //       tnc_date: tncDate,
  //       email: email,
  //       citizen: citizen,
  //       full_name: fullName,
  //       nik: nik,
  //       born_date: bornDate,
  //       country_code: countryCode,
  //       passport_number: passportNumber,
  //       request_time: requestTime,
  //     );
  //     final _response = await _rest.doRegister(_requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return RegisterResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     return RegisterResponse(message: e.response?.data['message'] ?? e.message, success: false, messageCode: e.response?.data['messageCode']);
  //   } catch (e) {
  //     return RegisterResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<RegisterVerifcationResponse> doVerifyRegister({
  //   required String email,
  //   required String mobileNumber,
  //   required String otp,
  //   required String deviceId,
  //   required String brand,
  //   required String osType,
  //   required String osVersion,
  // }) async {
  //   try {
  //     final _requestData = RegisterVerificationRequest(
  //       email: email,
  //       mobile_number: mobileNumber,
  //       otp: otp,
  //       device_id: deviceId,
  //       brand: brand,
  //       os_type: osType,
  //       os_version: osVersion,
  //     );
  //     final _response = await _rest.doVerifyRegister(_requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return RegisterVerifcationResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     return RegisterVerifcationResponse(message: e.response?.data['message'] ?? e.message, success: false);
  //   } catch (e) {
  //     return RegisterVerifcationResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<UserResponse> doGetUser({bool? isNeedUpdate}) async {
  //   String? authToken = await storage.getAuthToken;

  //   Future<UserResponse> _fetchRemoteData() async {
  //     final _response = await _rest.doGetUser(authToken ?? '');
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');
  //     await storage.write(StorageKey.profileData, _decryptedData);
  //     final _dataRemote = UserResponse.fromJson(jsonDecode(_decryptedData));
  //     await storage.write(StorageKey.fullName, _dataRemote.data?.full_name ?? '');
  //     return _dataRemote;
  //   }

  //   try {
  //     final UserResponse? _dataParse;
  //     final connect = await NetworkConnectivity().isConnected;
  //     if (isNeedUpdate == false || !connect) {
  //       final _profileDataStr = await storage.read(StorageKey.profileData);
  //       if (_profileDataStr?.isNotEmpty ?? false) {
  //         _dataParse = UserResponse.fromJson(jsonDecode(_profileDataStr ?? ''));
  //       } else {
  //         _dataParse = await _fetchRemoteData();
  //       }
  //     } else {
  //       _dataParse = await _fetchRemoteData();
  //     }
  //     return _dataParse;
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);

  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;

  //       try {
  //         final _response = await _rest.doGetUser(authToken ?? '');
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');
  //         final _dataParse = UserResponse.fromJson(jsonDecode(_decryptedData));
  //         await storage.write(StorageKey.fullName, _dataParse.data?.full_name ?? '');
  //         return _dataParse;
  //       } on DioError catch (_) {
  //         return UserResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return UserResponse(message: e.response?.data['message'] ?? e.message, success: false, messageCode: '401');
  //     }
  //     return UserResponse(message: e.response?.data['message'] ?? e.message, success: false);
  //   } catch (e) {
  //     return UserResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<GeneralResponse> doLogout() async {
  //   String? authToken = await storage.getAuthToken;
  //   try {
  //     final _response = await _rest.doLogout(authToken ?? '');
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return GeneralResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.doLogout(authToken ?? '');
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return GeneralResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (_) {
  //         return GeneralResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           code: 201,
  //           messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return GeneralResponse(message: e.response?.data['message'] ?? e.message, success: false, code: 201, messageCode: '401');
  //     }
  //     return GeneralResponse(message: e.response?.data['message'] ?? e.message, success: false, code: 201);
  //   } catch (e) {
  //     return GeneralResponse(message: e.toString(), success: false, code: 201);
  //   }
  // }

  // @override
  // Future<CheckinResponse> doCheckinVVIP({required String qrCode, required String type}) async {
  //   String? authToken = await storage.getAuthToken;
  //   final _requestData = CheckinRequest(qrCode: qrCode, type: type);

  //   try {
  //     final _response = await _rest.doCheckinVVIP(authToken ?? '', _requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return CheckinResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     var checkinTime = DateTime.now();
  //     final localDataString = await storage.getCheckinData;
  //     final checkinExp = remoteConfig.getCheckinExp ?? 0;
  //     final success = DateTime.now().difference(checkinTime).inMinutes < checkinExp;
  //     LocalCheckinResponse? localCheckinResponse;
  //     if (localDataString?.isNotEmpty ?? false) {
  //       localCheckinResponse = LocalCheckinResponse.fromJson(jsonDecode(localDataString ?? ''));
  //     }
  //     var tempList = localCheckinResponse?.listCheckIn?.where((element) => element.data?.first.place?.qr_code?.check_in != qrCode).toList() ?? [];

  //     if (tempList.isNotEmpty) {
  //       checkinTime = DateTime.parse(tempList.first.data?.first.check_in_time ?? '');
  //     }
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.doCheckinVVIP(authToken ?? '', _requestData);
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return CheckinResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (_) {
  //         if (e.type == DioErrorType.other && success) {
  //           final qrCodeCheckout = "checkout:${qrCode.split(':').last}";
  //           return CheckinResponse(success: success, code: 111, data: [
  //             Datum(
  //               check_in_time: DateTime.now().toIso8601String(),
  //               place: CheckinPlace(qr_code: QrCodeMerchant(check_in: qrCode, check_out: qrCodeCheckout)),
  //               is_group: type == 'group',
  //             )
  //           ]);
  //         } else {
  //           return CheckinResponse(
  //             message: e.response?.data['message'] ?? e.message,
  //             success: false,
  //             code: e.response?.statusCode ?? 0,
  //             messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //           );
  //         }
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return CheckinResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     if (e.type == DioErrorType.other && success) {
  //       final qrCodeCheckout = "checkout:${qrCode.split(':').last}";
  //       return CheckinResponse(success: success, code: 111, data: [
  //         Datum(
  //           check_in_time: DateTime.now().toIso8601String(),
  //           place: CheckinPlace(qr_code: QrCodeMerchant(check_in: qrCode, check_out: qrCodeCheckout)),
  //           is_group: type == 'group',
  //         )
  //       ]);
  //     } else {
  //       return CheckinResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0);
  //     }
  //   } catch (e) {
  //     return CheckinResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<CheckinResponse> doCheckin({required String qrCode, required String type}) async {
  //   String? authToken = await storage.getAuthToken;
  //   final _requestData = CheckinRequest(qrCode: qrCode, type: type);

  //   try {
  //     final _response = await _rest.doCheckin(authToken ?? '', _requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return CheckinResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     var checkinTime = DateTime.now();
  //     final localDataString = await storage.getCheckinData;
  //     final checkinExp = remoteConfig.getCheckinExp ?? 0;
  //     final success = DateTime.now().difference(checkinTime).inMinutes < checkinExp;
  //     LocalCheckinResponse? localCheckinResponse;
  //     if (localDataString?.isNotEmpty ?? false) {
  //       localCheckinResponse = LocalCheckinResponse.fromJson(jsonDecode(localDataString ?? ''));
  //     }

  //     var tempList = localCheckinResponse?.listCheckIn?.where((element) => element.data?.first.place?.qr_code?.check_in != qrCode).toList() ?? [];

  //     if (tempList.isNotEmpty) {
  //       checkinTime = DateTime.parse(tempList.first.data?.first.check_in_time ?? '');
  //     }
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;

  //       try {
  //         final _response = await _rest.doCheckin(authToken ?? '', _requestData);
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return CheckinResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (err) {
  //         if (err.type == DioErrorType.other && success) {
  //           final qrCodeCheckout = "checkout:${qrCode.split(':').last}";
  //           return CheckinResponse(success: success, code: 111, data: [
  //             Datum(
  //               check_in_time: DateTime.now().toIso8601String(),
  //               place: CheckinPlace(qr_code: QrCodeMerchant(check_in: qrCode, check_out: qrCodeCheckout)),
  //               is_group: type == 'group',
  //             ),
  //           ]);
  //         } else {
  //           return CheckinResponse(
  //             message: e.response?.data['message'] ?? e.message,
  //             success: false,
  //             code: e.response?.statusCode ?? 0,
  //             messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //           );
  //         }
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return CheckinResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     if (e.type == DioErrorType.other && success) {
  //       final qrCodeCheckout = "checkout:${qrCode.split(':').last}";
  //       return CheckinResponse(success: success, code: 111, data: [
  //         Datum(
  //           check_in_time: DateTime.now().toIso8601String(),
  //           place: CheckinPlace(qr_code: QrCodeMerchant(check_in: qrCode, check_out: qrCodeCheckout)),
  //           is_group: type == 'group',
  //         ),
  //       ]);
  //     } else {
  //       return CheckinResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0);
  //     }
  //   } catch (e) {
  //     return CheckinResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<PPDNPPLNResponse> doCheckinPPDNPPLN({required String qrCode, required String type}) async {
  //   String? authToken = await storage.getAuthToken;
  //   final _requestData = CheckinRequest(qrCode: qrCode, type: type);

  //   try {
  //     final _response = await _rest.doCheckinPPDNPPLN(authToken ?? '', _requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return PPDNPPLNResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.doCheckinPPDNPPLN(authToken ?? '', _requestData);
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return PPDNPPLNResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (err) {
  //         return PPDNPPLNResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           code: err.response?.statusCode ?? 0,
  //           messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return PPDNPPLNResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     return PPDNPPLNResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0);
  //   } catch (e) {
  //     return PPDNPPLNResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<CheckinResponse> doCheckout({required String qrCode, required String type}) async {
  //   String? authToken = await storage.getAuthToken;
  //   final _requestData = CheckoutRequest(qrCode: qrCode, type: type);

  //   try {
  //     final _response = await _rest.doCheckout(authToken ?? '', _requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return CheckinResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.doCheckout(authToken ?? '', _requestData);
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return CheckinResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (err) {
  //         return CheckinResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           code: err.response?.statusCode ?? 0,
  //           messageCode:
  //               (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : e.response?.data['message'],
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return CheckinResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     return CheckinResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: e.response?.data['messageCode']);
  //   } catch (e) {
  //     return CheckinResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<AddMemberResponse> doAddMember({
  //   required String fullName,
  //   required String bornData,
  //   required String countryCode,
  //   required String passportNumber,
  //   required String nik,
  //   required String relationId,
  //   required String citizen,
  // }) async {
  //   String? authToken = await storage.getAuthToken;
  //   final _requestData = AddMemberRequest(
  //     fullName: fullName,
  //     bornDate: bornData,
  //     countryCode: countryCode,
  //     passportNumber: passportNumber,
  //     nik: nik,
  //     relationId: relationId,
  //     citizen: citizen,
  //   );

  //   try {
  //     final _response = await _rest.doAddMember('${authToken}', _requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return AddMemberResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.doAddMember('${authToken}', _requestData);
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return AddMemberResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (err) {
  //         return AddMemberResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           code: err.response?.statusCode ?? 0,
  //           messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return AddMemberResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     return AddMemberResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0);
  //   } catch (e) {
  //     return AddMemberResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<MembersResponse> getMembers({bool? isNeedUpdate}) async {
  //   String? authToken = await storage.getAuthToken;
  //   final connect = await NetworkConnectivity().isConnected;

  //   Future<MembersResponse> _fetchRemoteData() async {
  //     final _response = await _rest.getMembers(authToken ?? '');
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');
  //     final boxMember = HiveHelper.getLocalMember();
  //     final MembersResponse membersResponse = MembersResponse.fromJson(jsonDecode(_decryptedData));
  //     await boxMember.put('dataMember', membersResponse);
  //     return membersResponse;
  //   }

  //   Future<MembersResponse> _getMemberResponse() async {
  //     MembersResponse _memberResponse;
  //     await HiveHelper.openMember();
  //     if (isNeedUpdate == false || !connect) {
  //       final member = HiveHelper.getLocalMember();
  //       if (member.get('dataMember') != null) {
  //         _memberResponse = member.get('dataMember') ?? MembersResponse();
  //       } else {
  //         _memberResponse = await _fetchRemoteData();
  //       }
  //     } else {
  //       _memberResponse = await _fetchRemoteData();
  //     }
  //     Hive.close();
  //     return _memberResponse;
  //   }

  //   try {
  //     final _memberResponse = await _getMemberResponse();
  //     return _memberResponse;
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _memberResponse = await _getMemberResponse();
  //         return _memberResponse;
  //       } on DioError catch (err) {
  //         return MembersResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           code: err.response?.statusCode ?? 0,
  //           messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return MembersResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     return MembersResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0);
  //   } catch (e) {
  //     return MembersResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<GeneralResponse> deleteMember({required String memberId}) async {
  //   String? authToken = await storage.getAuthToken;
  //   try {
  //     final _response = await _rest.deleteMember(authToken ?? '', DeleteMemberRequest(memberId: memberId));
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return GeneralResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.deleteMember(authToken ?? '', DeleteMemberRequest(memberId: memberId));
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return GeneralResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (err) {
  //         return GeneralResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           code: err.response?.statusCode ?? 0,
  //           messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return GeneralResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     return GeneralResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0);
  //   } catch (e) {
  //     return GeneralResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<GeneralResponse> updateFlag({required Iterable<DataMember> dataMember}) async {
  //   String? authToken = await storage.getAuthToken;
  //   final listData = dataMember.map((e) => ToUpdate(memberId: e.memberId, isFlag: e.isGroupCheckin));
  //   final updateFlagRequest = UpdateFlagRequest(toUpdate: listData.toList());

  //   try {
  //     final _response = await _rest.updateFlag(authToken ?? '', updateFlagRequest);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return GeneralResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.updateFlag(authToken ?? '', updateFlagRequest);
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return GeneralResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (err) {
  //         return GeneralResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           code: err.response?.statusCode ?? 0,
  //           messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return GeneralResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     return GeneralResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0);
  //   } catch (e) {
  //     return GeneralResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<CheckinResponse> doCheckoutVVIP({required String qrCode, required String type}) async {
  //   String? authToken = await storage.getAuthToken;
  //   final _requestData = CheckoutRequest(qrCode: qrCode, type: type);

  //   try {
  //     final _response = await _rest.doCheckoutVVIP(authToken ?? '', _requestData);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return CheckinResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     var checkinTime = DateTime.now();
  //     final localDataString = await storage.getCheckinData;
  //     final checkinExp = remoteConfig.getCheckinExp ?? 0;
  //     final success = DateTime.now().difference(checkinTime).inMinutes < checkinExp;
  //     LocalCheckinResponse? localCheckinResponse = LocalCheckinResponse.fromJson(jsonDecode(localDataString ?? ''));
  //     var tempList = localCheckinResponse.listCheckIn?.where((element) => element.data?.first.place?.qr_code?.check_in != qrCode).toList() ?? [];

  //     if (tempList.isNotEmpty) {
  //       checkinTime = DateTime.parse(tempList.first.data?.first.check_in_time ?? '');
  //     }
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.doCheckoutVVIP(authToken ?? '', _requestData);
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return CheckinResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (err) {
  //         if (e.type == DioErrorType.other && success) {
  //           return CheckinResponse(
  //               success: success,
  //               code: 111,
  //               data: [
  //                 Datum(
  //                   check_in_time: DateTime.now().toIso8601String(),
  //                 )
  //               ],
  //               messageCode: err.response?.data['messageCode']);
  //         } else {
  //           return CheckinResponse(
  //             message: e.response?.data['message'] ?? e.message,
  //             success: false,
  //             code: e.response?.statusCode ?? 0,
  //             messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token')
  //                 ? '401'
  //                 : err.response?.data['messageCode'],
  //           );
  //         }
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return CheckinResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     if (e.type == DioErrorType.other && success) {
  //       return CheckinResponse(success: success, code: 111, data: [Datum(check_in_time: DateTime.now().toIso8601String())], messageCode: e.response?.data['messageCode']);
  //     } else {
  //       return CheckinResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: e.response?.data['messageCode']);
  //     }
  //   } catch (e) {
  //     return CheckinResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<GeneralResponse> doUpdateProfile({
  //   required String bornDate,
  //   required String citizen,
  //   required String email,
  //   required String fullName,
  //   required String mobileNumber,
  //   required String nik,
  //   required String passportNumber,
  //   required String imageId,
  //   required String countryCode,
  // }) async {
  //   String? authToken = await storage.getAuthToken;
  //   final _request = UpdateProfileRequest(
  //       born_date: bornDate,
  //       citizen: citizen,
  //       country_code: countryCode,
  //       email: email,
  //       full_name: fullName,
  //       mobile_number: mobileNumber,
  //       nik: nik,
  //       passport_number: passportNumber,
  //       photo_image_id: imageId);

  //   try {
  //     final _response = await _rest.doUpdateProfile(authToken ?? '', _request);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return GeneralResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.doUpdateProfile(authToken ?? '', _request);
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return GeneralResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (err) {
  //         return GeneralResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           code: err.response?.statusCode ?? 0,
  //           messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return GeneralResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     return GeneralResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0);
  //   } catch (e) {
  //     return GeneralResponse(message: e.toString(), success: false);
  //   }
  // }

  // @override
  // Future<UploadFileResponse> doUploadFile({required File file}) async {
  //   String? authToken = await storage.getAuthToken;

  //   try {
  //     final _response = await _rest.doUploadFile(authToken ?? '', file.path.split('/').last, file);
  //     final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //     return UploadFileResponse.fromJson(jsonDecode(_decryptedData));
  //   } on DioError catch (e) {
  //     final _statusCode = await refreshToken(e);
  //     if (_statusCode == 200) {
  //       authToken = await storage.getAuthToken;
  //       try {
  //         final _response = await _rest.doUploadFile(authToken ?? '', file.path.split('/').last, file);
  //         final _decryptedData = await cryptoGraphyHelper.getDecryptedRSAHybrid(_response.data?.ciphertext ?? '');

  //         return UploadFileResponse.fromJson(jsonDecode(_decryptedData));
  //       } on DioError catch (err) {
  //         return UploadFileResponse(
  //           message: e.response?.data['message'] ?? e.message,
  //           success: false,
  //           code: err.response?.statusCode ?? 0,
  //           messageCode: (e.response?.data['message'] ?? '').toString().contains('expired') || (e.response?.data['message'] ?? '').toString().contains('invalid token') ? '401' : null,
  //         );
  //       }
  //     } else if (_statusCode == 401 || _statusCode == 500) {
  //       return UploadFileResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0, messageCode: '401');
  //     }

  //     return UploadFileResponse(message: e.response?.data['message'] ?? e.message, success: false, code: e.response?.statusCode ?? 0);
  //   } catch (e) {
  //     return UploadFileResponse(message: e.toString(), success: false);
  //   }
  // }
// }
