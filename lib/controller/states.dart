
import '../models/favorite_products_model.dart';
import '../models/user/user_data_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class BottomNavState extends AppStates {}

class ModeState extends AppStates {}

class CashPayState extends AppStates {}

class CreditPayState extends AppStates {}

//rete

class RateSuccessState extends AppStates {}

class RateErrorState extends AppStates {}
//GetProducts
class GetProductsLoadingState extends AppStates {}

class GetProductsSuccessState extends AppStates {}

class GetProductsErrorState extends AppStates {}
//GetOffers
class GetOffersLoadingState extends AppStates {}

class GetOffersSuccessState extends AppStates {}

class GetOffersErrorState extends AppStates {}

//GetCategories
class GetCategoriesSuccessState extends AppStates {}
class GetCategoryProductsState extends AppStates {}

class GetCategoriesLoadingState extends AppStates {}

class GetCategoriesErrorState extends AppStates {}

//GetServicesCategories
class GetServicesCategoriesLoadingState extends AppStates {}

class GetServicesCategoriesSuccessState extends AppStates {}

class GetServicesCategoriesErrorState extends AppStates {}

//GetServicesList
class GetServicesListLoadingState extends AppStates {}

class GetServicesListSuccessState extends AppStates {}

class GetServicesListErrorState extends AppStates {}

//SubmitForm
class SubmitFormLoadingState extends AppStates {}

class SubmitFormSuccessState extends AppStates {}

class SubmitFormErrorState extends AppStates {}

//GetFav
class GetFavoriteLoadingState extends AppStates {}

class GetFavoriteSuccessState extends AppStates {
  final FavoritesModel favoritesModel;

  GetFavoriteSuccessState(this.favoritesModel);
}

class GetFavoriteErrorState extends AppStates {}

//GetCart
class GetCartLoadingState extends AppStates {}

class GetCartSuccessState extends AppStates {}

class GetCartErrorState extends AppStates {}

//GetOrder
class GetOrderLoadingState extends AppStates {}

class GetOrderSuccessState extends AppStates {}

class GetOrderErrorState extends AppStates {}

//Payment
class PaymentLoadingState extends AppStates {}

class PaymentSuccessState extends AppStates {}

class PaymentErrorState extends AppStates {}

//AddToCart
class AddToCartSuccessState extends AppStates {}

class AddToCartErrorState extends AppStates {}

//RemoveFromCart
class RemoveFromCartSuccessState extends AppStates {}

class RemoveFromCartErrorState extends AppStates {}
//AddToFavorite
class AddToFavoriteSuccessState extends AppStates {}

class AddToFavoriteErrorState extends AppStates {}

//RemoveFromFavorite
class RemoveFromFavoriteSuccessState extends AppStates {}

class RemoveFromFavoriteErrorState extends AppStates {}
//AddQuantity
class AddQuantitySuccessState extends AppStates {}

class AddQuantityErrorState extends AppStates {}
//SubQuantity
class SubQuantitySuccessState extends AppStates {}

class SubQuantityErrorState extends AppStates {}

// DELETE CART
class DeleteCartErrorState extends AppStates {}

class DeleteCartSuccessState extends AppStates {}

//USER
class GetUserDataLoadingState extends AppStates {}

class GetUserDataSuccessState extends AppStates {}

class GetUserDataErrorState extends AppStates {}

class UpdateUserDataLoadingState extends AppStates {}

class UpdateUserDataSuccessState extends AppStates {
  final UserDataModel userDataModel;

  UpdateUserDataSuccessState(this.userDataModel);
}

class UpdateUserDataErrorState extends AppStates {}

//SEARCH
class ProductSearchLoadingState extends AppStates {}

class ProductSearchSuccessState extends AppStates {}

class ProductSearchErrorState extends AppStates {}

//SEARCH
class CategorySearchLoadingState extends AppStates {}

class CategorySearchSuccessState extends AppStates {}

class CategorySearchErrorState extends AppStates {}

//SIGN OUT
class SignOutLoadingState extends AppStates {}

class SignOutSuccessState extends AppStates {}

class SignOutErrorState extends AppStates {}
