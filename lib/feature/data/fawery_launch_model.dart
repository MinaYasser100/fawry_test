// model take charge items that customer buy it from app
import 'package:fawry_sdk/model/bill_item.dart';
import 'package:fawry_sdk/model/fawry_launch_model.dart';
import 'package:fawry_sdk/model/launch_customer_model.dart';
import 'package:fawry_sdk/model/payment_methods.dart';
import 'package:fawry_test/feature/data/fawry_api.dart';

FawryLaunchModel model = FawryLaunchModel(
  allow3DPayment: true,
  chargeItems: chargeItems,
  launchCustomerModel: customerModel,
  launchMerchantModel: FawryServices.getMerchantModel(),
  skipLogin: true,
  skipReceipt: true,
  payWithCardToken: false,
  paymentMethods: PaymentMethods.ALL,
);

LaunchCustomerModel customerModel = LaunchCustomerModel(
  customerProfileId: '533518',
  customerName: 'John Doe',
  customerEmail: 'john.doe@xyz.com',
  customerMobile: '+201000000000',
);

BillItem item = BillItem(
  itemId: 'BOOK1',
  description: '',
  quantity: 1,
  price: 30,
);

List<BillItem> chargeItems = [item];
