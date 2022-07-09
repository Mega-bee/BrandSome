import 'package:brandsome/abstracts/states/loading_state.dart';
import 'package:brandsome/abstracts/states/state.dart';
import 'package:brandsome/di/di_config.dart';
import 'package:brandsome/hive/hive.dart';
import 'package:brandsome/hive/hive_category.dart';
import 'package:brandsome/hive/hive_city.dart';
import 'package:brandsome/home_page/ui/screen/homePage.dart';
import 'package:brandsome/home_page/ui/state/homepage_success.dart';
import 'package:brandsome/liked_module/liked_list_route.dart';
import 'package:brandsome/module_auth/repository/auth_repository.dart';
import 'package:brandsome/module_auth/request/otp_request.dart';
import 'package:brandsome/module_auth/service/auth_service.dart';
import 'package:brandsome/module_auth/ui/state/ErrorSendOtp.dart';
import 'package:brandsome/module_auth/ui/state/loading_alert.dart';
import 'package:brandsome/module_auth/ui/state/request_otp_alert_state.dart';
import 'package:brandsome/module_auth/ui/state/verify_otp_alert_state.dart';
import 'package:brandsome/utils/global/global_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/error_state.dart';
import '../repository/home_repository.dart';
import '../request/is_like.dart';
import '../response/home_page.dart';

@injectable
class HomePageCubit extends Cubit<States> {
  final AuthService _authService;
  final AuthRepository _authRepository;
  final GeneralDataHelper _dataHelper;
  final HomeP _homePage;

  HomePageCubit(this._authService, this._authRepository, this._homePage, this._dataHelper)
      : super(LoadingState());

  getToLikeList(HomePageScreenState screenState , String id) {
    if (_authService.isLoggedIn) {
      Navigator.pushNamed(
        screenState.context,
        LikedListRoute.LIKED_LIST,
        arguments: id,
      );
    } else {
      emit(RequestOtpState(screenState));
    }
  }

  getHome(HomePageScreenState screenState) {
    _homePage.getHomePage().then((value) {
      if (value == null) {
        emit(ErrorState(
            errorMessage: 'Connection error',
            retry: () {
              getHome(screenState);
            }));
      } else if (value.code == 200) {
        HomePageResponse hom = HomePageResponse.fromJson(value.data.insideData);

        List<HiveCity> citiesHive =[];
        hom.cities?.forEach((element) {
          citiesHive.add(HiveCity(name: element.name , id: element.id));
        });

        List<HiveMainCategory> categories =[];


        hom.categories?.forEach((element) {
          List<HiveSubCategory> subCategories =[];
          element.subs.forEach((element) {
            List<HiveService> service =[];
            element.services.forEach((element) {
              service.add(HiveService(id: element.id , name: element.name));
            });
            subCategories.add(HiveSubCategory(name: element.name ,id: element.id,service: service));
          });
          categories.add(HiveMainCategory(name: element.name ,id: element.id,subs: subCategories));
        });

        _dataHelper.setCities(citiesHive);
        _dataHelper.setCategories(categories);
        emit(HomePageSuccess(
            screenState, hom.postt ?? [], _authService.isLoggedIn));
      }
    });
  }

  Islike(HomePageScreenState screenState, LikeRequest request, String? id) {
    if (_authService.isLoggedIn) {
      _homePage.Like(id, request).then((value) {
        if (value!.code == 200) {
          Fluttertoast.showToast(msg: "Like Post success");
          print("is foloowowowowowowowowowowowowowowoowowow");
        }
      });
    } else {
      emit(RequestOtpState(screenState));
    }
  }

  requestOtp(HomePageScreenState screenState, OtpRequest request) {
      emit(LoadingAlertState());
      _authRepository.requestOtp(request).then((value) {
        if (value == null) {
          emit(ErrorAlertState('Somtheing error'));
        } else if (value.code == 200) {
          Navigator.pop(screenState.context);
          emit(VerifyOtpState(
              phoneNumber: request.number, screenState: screenState));
        } else if (value.code != 200) {
          Navigator.pop(screenState.context);
          emit(ErrorAlertState(value.errorMessage));
        }
      });
    }

    verifyOtp(HomePageScreenState screenState, VerifyOtpRequest request) {
      emit(LoadingAlertState());
      _authRepository.verifyOtp(request).then((value) {
        if (value == null) {
          emit(ErrorAlertState('Somtheing error'));
        } else if (value.code == 200) {
          Navigator.pop(screenState.context);
          String token = value.data.insideData;
          _authService.setToken(token);
          Fluttertoast.showToast(msg: 'Your account created Successfuly',backgroundColor: Colors.green);
          getIt<GlobalStateManager>().update();
        } else if (value.code != 200) {
          Navigator.pop(screenState.context);
          emit(VerifyOtpState(
              phoneNumber: request.number,
              screenState: screenState,
              errorMessage: value.errorMessage));
        }
      });
    }
  }
