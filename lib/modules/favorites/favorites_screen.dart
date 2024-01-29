import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components.dart';
import '../../controller/cubit.dart';
import '../../controller/states.dart';
import '../../shared/custom_widgets/custom_texts.dart';
import '../../shared/style/icon_broken.dart';
import '../../widgets/favorites_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getFavouritesData();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  IconBroken.Arrow___Left_2,
                  color: Colors.black,
                )),
            title: const Text('Wishlist'),
          ),
          body: Column(
            children: [
              Expanded(
                child: cubit.favoritesModel != null
                    ? ListView.separated(
                        itemBuilder: (context, index) => FavoriteItem(
                          favProductModel:
                              cubit.favoritesModel!.productFavorite[index],
                        ),
                        separatorBuilder: (context, index) => SpaceHeight(),
                        itemCount: cubit.favoritesModel!.productFavorite.length,
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              child: Icon(Icons.heart_broken),
                            ),
                            TitleLargeText('Favorites Is Empty'),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
