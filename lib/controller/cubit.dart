import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnify/modules/setting/setting_screen.dart';
import '../models/carts/get_carts_model.dart';
import '../models/category_model.dart';
import '../models/favorite_products_model.dart';
import '../models/in_home/products_list_model.dart';
import '../models/orders/orders_model.dart';
import '../models/orders/payment_model.dart';
import '../models/in_home/search_model.dart';
import '../models/services/services_list_model.dart';
import '../models/user/user_data_model.dart';
import '../modules/cart/cart_screen.dart';
import '../modules/categories/categories_screen.dart';
import '../modules/home/HomeScreen.dart';
import '../modules/setting/services/services_screen.dart';
import '../shared/constants.dart';
import '../shared/network/end_points.dart';
import '../shared/network/local/cache_helper.dart';
import '../shared/network/remote/dio_helper.dart';
import '../shared/style/icon_broken.dart';
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  //Layout

  late var ratingController = TextEditingController(text: '3.0');
  late double rating;
  double initialRating = 2.0;

  void ratingChange() {
    ratingController = TextEditingController(text: '3.0');
    rating = initialRating;
  }

  var currentIndex = 0;

  List<String> titlesList = [
    'Home',
    'Categories',
    'Carts',
    'Services',
    'Setting',
  ];

  List<IconData> iconsList = [
    Icons.home_rounded,
    Icons.category_outlined,
    IconBroken.Bag,
    Icons.settings_rounded,
    Icons.settings,
  ];

  List<Widget> bottomScreens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const ServicesScreen(),
    const SettingScreen(),
  ];

  List<BottomNavyBarItem> bottomItems = [
    BottomNavyBarItem(
      icon: const Icon(
        IconBroken.Home,
        size: 24,
      ),
      title: const Text('Home'),
      activeColor: Colors.white,
      inactiveColor: Colors.grey,
    ),
    BottomNavyBarItem(
      icon: const Icon(
        Icons.category_outlined,
        size: 24,
      ),
      title: const Text(' Category'),
      activeColor: Colors.white,
      inactiveColor: Colors.grey,
    ),
    BottomNavyBarItem(
      icon: const Icon(
        IconBroken.Bag,
        size: 24,
      ),
      title: const Text('Cart'),
      activeColor: Colors.white,
      inactiveColor: Colors.grey,
    ),
    BottomNavyBarItem(
      icon: const Icon(
        Icons.design_services,
        size: 24,
      ),
      title: const Text('Services'),
      activeColor: Colors.white,
      inactiveColor: Colors.grey,
    ),
    BottomNavyBarItem(
      icon: const Icon(
        Icons.settings,
        size: 24,
      ),
      title: const Text('Settings'),
      activeColor: Colors.white,
      inactiveColor: Colors.grey,
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(BottomNavState());
    debugPrint('$currentIndex');
  }

//app mode
  bool isDark = false;
  void changeMode({bool? shared}) {
    if (shared != null) {
      isDark = shared;
      emit(ModeState());
    } else {
      isDark = !isDark;
      CacheHelper.saveData(
        key: 'isDark',
        value: isDark,
      ).then((value) {
        emit(ModeState());
      });
    }
  }

  void rate(String id, double? rates) {
    DioHelper.postData(url: 'products/$id/create_review/', data: {
      "rating": rates,
      //"description": "Good Chair "
    }).then((value) {
      emit(RateSuccessState());
      debugPrint('========= rating success');
    }).catchError((error) {
      emit(RateErrorState());
      debugPrint('rating error ========= ${error.toString()}');
    });
  }

  //products
  ProductsModel? productsModel;
  void getProducts() {
    emit(GetProductsLoadingState());
    DioHelper.getData(
      url: PRODUCTS,
    ).then(
      (value) {
        productsModel = ProductsModel.fromJson(value.data);
        emit(GetProductsSuccessState());
        debugPrint('getProducts ========= ${value.data}');
      },
    ).catchError((error) {
      debugPrint('getProducts ERROR ========= ${error.toString()}');
      emit(GetProductsErrorState());
    });
  }

  ProductsModel? topRatedModel;
  void getTopRated() {
    emit(GetProductsLoadingState());
    DioHelper.getData(
      url: 'products/top_rated/',
    ).then(
      (value) {
        topRatedModel = ProductsModel.fromJson(value.data);
        debugPrint('getTopRated ========= ${value.data}');
        emit(GetProductsSuccessState());
      },
    ).catchError((error) {
      debugPrint('getTopRated ERROR ========= ${error.toString()}');
      emit(GetProductsErrorState());
    });
  }

  //category
  CategoriesModel? categoriesModel;
  void getCategoriesData() {
    emit(GetCategoriesLoadingState());
    DioHelper.getData(
      url: CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(GetCategoriesSuccessState());
      debugPrint('getCategoriesData ========= ${value.data}');
    }).catchError((error) {
      emit(GetCategoriesErrorState());
      debugPrint('getCategoriesData error ======== ${error.toString()}');
    });
  }

  List<ProductModel> categoryProductList = [];
  void getCategoryItem(int id) {
    categoryProductList = [];
    for (var element in productsModel!.products) {
      if (element.category == id) {
        //id === index of category
        categoryProductList.add(element);
      }
    }
    emit(GetCategoryProductsState());
    debugPrint('${categoryProductList.length}');
  }

  //carts
  CartsModel? getCartsModel;
  List<CartDetailsModel> details = [];

  void getCartData() {
    emit(GetCartLoadingState());
    DioHelper.getData(
      url: GET_CARTS,
    ).then(
      (value) {
        getCartsModel = CartsModel.fromJson(value.data);
        details = getCartsModel!.details;
        debugPrint('getCartData ========= ${value.data}');
        debugPrint('status code ========= ${value.statusCode}');

        emit(GetCartSuccessState());
      },
    ).catchError(
      (error) {
        emit(GetCartErrorState());
        debugPrint('getCartData ERROR ========= ${error.toString()}');
      },
    );
  }

  void addToCart({
    required int productId,
    int quantity = 1,
  }) {
    DioHelper.postData(
      url: ADD_TO_CART,
      data: {
        'product_id': productId,
        'quantity': quantity,
      },
    ).then((value) {
      emit(AddToCartSuccessState());
      debugPrint('addToCart ========= ${value.data}');
    }).catchError((error) {
      emit(AddToCartErrorState());
      debugPrint('addToCart ERROR ========= ${error.toString()}');
    });
  }

  void removeFromCart({
    required int? productId,
  }) {
    DioHelper.deleteData(
      url: 'orders/remove_from_cart/$productId/',
    ).then((value) {
      debugPrint('removeFromCart ========= ${value.data}');
      getCartData();
      emit(RemoveFromCartSuccessState());
    }).catchError((error) {
      emit(RemoveFromCartErrorState());
      debugPrint('removeFromCart ERROR ========= ${error.toString()}');
    });
  }

  void deleteCart() {
    DioHelper.deleteData(url: DELETE_CART).then((value) {
      debugPrint('deleteCart ========= ${value.data}');
      emit(DeleteCartSuccessState());
    }).catchError((error) {
      emit(DeleteCartErrorState());
      debugPrint('deleteCart ERROR ========= ${error.toString()}');
    });
  }

  void addQuantity({
    required String productId,
  }) {
    DioHelper.postData(url: '$ADD_QUANTITY$productId/').then((value) {
      debugPrint('addQuantity ========= ${value.data}');
      emit(AddQuantitySuccessState());
      getCartData();
    }).catchError((error) {
      emit(AddQuantityErrorState());
      debugPrint('addQuantity ERROR ========= ${error.toString()}');
    });
  }

  void subQuantity({
    required String productId,
  }) {
    DioHelper.postData(url: '$SUB_QUANTITY$productId/').then(
      (value) {
        debugPrint('subQuantity ========= ${value.data}');
        emit(SubQuantitySuccessState());
        getCartData();
      },
    ).catchError((error) {
      emit(SubQuantityErrorState());
      debugPrint('subQuantity ERROR ========= ${error.toString()}');
    });
  }

  //favorites
  FavoritesModel? favoritesModel;
  void getFavouritesData() {
    emit(GetFavoriteLoadingState());
    DioHelper.getData(
      url: SHOW_PRODUCTS_FAVORITE,
    ).then(
      (value) {
        favoritesModel = FavoritesModel.fromJson(value.data);
        debugPrint('getFavouritesData ========= ${value.data}');

        emit(GetFavoriteSuccessState(favoritesModel!));
      },
    ).catchError((error) {
      emit(GetFavoriteErrorState());
      debugPrint('getFavouritesData ERROR ========= ${error.toString()}');
    });
  }

  void addToFavorite({required String productId}) {
    DioHelper.postData(url: '$ADD_PRODUCT_FAVORITE$productId/').then((value) {
      debugPrint('addToFavorite : ${value.data}');
      emit(AddToFavoriteSuccessState());
    }).catchError((error) {
      emit(AddToFavoriteErrorState());
      debugPrint('addToFavorite ERROR ========= ${error.toString()}');
    });
  }

  void removeFromFavorite({required String productId}) {
    DioHelper.deleteData(url: '$REMOVE_PRODUCTS_FAVORITE$productId/')
        .then((value) {
      debugPrint('removeFromFavorite ========= ${value.data}');
      emit(RemoveFromCartSuccessState());
      getFavouritesData();
    }).catchError((error) {
      emit(RemoveFromCartErrorState());
      debugPrint('removeFromFavorite ERROR ========= ${error.toString()}');
    });
  }

  //orders
  OrdersModel? ordersModel;
  void getOrders() {
    emit(GetOrderLoadingState());
    DioHelper.getData(
      url: SHOW_ORDERS,
    ).then((value) {
      ordersModel = OrdersModel.fromJson(value.data);
      debugPrint('Orders ========= ${value.data}');

      emit(GetOrderSuccessState());
    }).catchError((error) {
      emit(GetOrderErrorState());
      debugPrint('getOrders ERROR ========= ${error.toString()}');
    });
  }

  PaymentModel? paymentModel;
  void payment({
    required String shipmentAddress,
    required String shipmentPhone,
    required String cardNumber,
    required String expireDate,
    required String securityCode,
  }) {
    emit(PaymentLoadingState());
    DioHelper.postData(url: PAYMENT, data: {
      "shipment_address": shipmentAddress,
      "shipment_phone": shipmentPhone,
      "card_number": cardNumber,
      "expire": expireDate,
      "security_code": securityCode,
    }).then((value) {
      debugPrint('payment ========= ${value.data}');
      emit(PaymentSuccessState());
      getCartData();
    }).catchError((error) {
      emit(PaymentErrorState());
      debugPrint('payment ERROR ========= ${error.toString()}');
    });
  }

  //services
  ServicesModel? servicesModel;
  void getServicesList() {
    emit(GetServicesListLoadingState());
    DioHelper.getData(
      url: SERVICES,
    ).then((value) {
      servicesModel = ServicesModel.fromJson(value.data);
      debugPrint('ServicesList ========= ${value.data}');
      emit(GetServicesListSuccessState());
    }).catchError((error) {
      emit(GetServicesListErrorState());
      debugPrint('getServicesList ERROR ========= ${error.toString()}');
    });
  }

  void submitService() {
    emit(SubmitFormLoadingState());
    DioHelper.postData(
      url: SUBMIT_FORM,
    ).then((value) {
      debugPrint('submitService :========= ${value.data}');
      emit(SubmitFormSuccessState());
    }).catchError((error) {
      emit(SubmitFormErrorState());
      debugPrint('submitService ERROR ========= ${error.toString()}');
    });
  }

  //user
  UserDataModel? userDataModel;
  void getUserData() {
    emit(GetUserDataLoadingState());
    DioHelper.getData(url: PROFILE, token: token_).then((value) {
      userDataModel = UserDataModel.fromJson(value.data);
      debugPrint('getUserData ========= $userDataModel');
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      emit(GetUserDataErrorState());
      debugPrint('getUserData ERROR ========= ${error.toString()}');
    });
  }

  void updateUserData({
    required String userName,
    required String email,
    required String phone,
    required String city,
    required String address,
  }) {
    emit(UpdateUserDataLoadingState());

    DioHelper.putData(
      url: PROFILE,
      data: {
        "username": userName,
        "email": email,
        "phone": phone,
        "city": city,
        "address": address,
      },
    ).then((value) {
      debugPrint('updateUserData ========= ${value.data}');
      emit(UpdateUserDataSuccessState(userDataModel!));
    }).catchError((error) {
      emit(UpdateUserDataErrorState());
      debugPrint('updateUserData ERROR ========= ${error.toString()}');
    });
  }

  //search
  SearchingModel? searchProduct;
  List<ProductSearchModel> search = [];
  void productSearch(String text) {
    emit(ProductSearchLoadingState());
    DioHelper.getData(
      url: SEARCH_PRODUCTS,
      query: {
        "search": text,
      },
      //data: {'':text},
    ).then((value) {
      debugPrint('search ========= ${value.data}');
      searchProduct = SearchingModel.fromJson(value.data);
      search = searchProduct!.product;
      emit(ProductSearchSuccessState());
    }).catchError((error) {
      emit(ProductSearchErrorState());
      debugPrint('search ERROR ========= ${error.toString()}');
    });
  }
}
