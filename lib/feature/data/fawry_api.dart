import 'package:fawry_sdk/fawry_sdk.dart';
import 'package:fawry_sdk/fawry_utils.dart';
import 'package:fawry_sdk/model/fawry_launch_model.dart';
import 'package:fawry_sdk/model/launch_merchant_model.dart';
import 'package:fawry_test/feature/data/merchant_data.dart';

class FawryServices {
  static LaunchMerchantModel getMerchantModel() {
    return LaunchMerchantModel(
      merchantCode: MerchantData.merchantCode,
      merchantRefNum: FawryUtils.randomAlphaNumeric(10),
      secureKey: MerchantData.secureKey,
    );
  }

  Future<void> startPayment(FawryLaunchModel model) async {
    try {
      await FawrySDK.instance.startPayment(
        launchModel: model,
        baseURL: MerchantData.baseUrl,
        lang: FawrySDK.LANGUAGE_ENGLISH,
      );
    } catch (e) {
      print('this is error form start payment : $e');
    }
  }

  Future<void> openCardsManager(FawryLaunchModel model) async {
    try {
      await FawrySDK.instance.openCardsManager(
        launchModel: model,
        baseURL: MerchantData.baseUrl,
        lang: FawrySDK.LANGUAGE_ENGLISH,
      );
    } catch (e) {
      print('this is error form open cards mananger : $e');
    }
  }
}
