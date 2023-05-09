
import 'package:ShopApp/models/LoginModel.dart';

abstract class ShopLoginStates {}
class ShopLoginInitialState extends ShopLoginStates {}
class ShopLoginLoadingState extends ShopLoginStates {}
class ShopLoginSuccessState extends ShopLoginStates {
  final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends ShopLoginStates {
  late final String error;
  ShopLoginErrorState(this.error);
}