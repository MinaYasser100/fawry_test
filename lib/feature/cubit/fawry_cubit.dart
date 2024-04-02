import 'dart:convert';

import 'package:fawry_sdk/fawry_sdk.dart';
import 'package:fawry_sdk/fawry_utils.dart';
import 'package:fawry_sdk/model/response.dart';
import 'package:fawry_test/feature/data/fawery_launch_model.dart';
import 'package:fawry_test/feature/data/fawry_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fawry_state.dart';

class FawryCubit extends Cubit<FawryState> {
  FawryCubit() : super(FawryInitial());

  Future<void> initSDKCallback() async {
    try {
      FawrySDK.instance.callbackResultStream().listen((event) {
        //set state
        ResponseStatus response = ResponseStatus.fromJson(jsonDecode(event));
        handleResponse(response);
        //////////////////////
        emit(FawryInitSDKCallback());
      });
    } catch (ex) {
      print('error during init');
    }
  }

  void handleResponse(ResponseStatus response) {
    switch (response.status) {
      case FawrySDK.RESPONSE_SUCCESS:
        {
          print('Message: ${response.message}');
          print('Json Response: ${response.data}');
        }
        break;
      case FawrySDK.RESPONSE_ERROR:
        {
          print('Error: ${response.message}');
        }
        break;
      case FawrySDK.RESPONSE_PAYMENT_COMPLETED:
        {
          print('Payment Completed: ${response.message}, ${response.data}');
        }
        break;
    }
  }

  Future<void> startPayment() async {
    model.launchMerchantModel.merchantRefNum =
        FawryUtils.randomAlphaNumeric(10);
    await FawryServices().startPayment(model);
    emit(FawryStartPayment());
  }

  Future<void> openCardsManager() async {
    model.launchMerchantModel.merchantRefNum =
        FawryUtils.randomAlphaNumeric(10);
    await FawryServices().openCardsManager(model);
    emit(FawryOpenCardsManager());
  }
}
