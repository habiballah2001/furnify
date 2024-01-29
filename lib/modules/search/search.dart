import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/cubit.dart';
import '../../controller/states.dart';
import '../../shared/custom_widgets/custom_text_field.dart';
import '../../shared/style/icon_broken.dart';
import '../../widgets/search_item.dart';

class SearchScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: searchController,
                type: TextInputType.text,
                hint: 'search',
                //prefix: IconBroken.Search,
                validate: (value) {
                  if (value!.isEmpty) {
                    return ' must be filled';
                  }
                  return null;
                },
                suffix: Icon(IconBroken.Search),
                suffixPressed: () {
                  AppCubit.get(context).productSearch("m");
                },
              ),
              Expanded(
                child: BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = AppCubit.get(context);
                    if(state is ProductSearchLoadingState){

                      return  const Center(child: CupertinoActivityIndicator(),);

                    }else if(cubit.search.isNotEmpty) {
                      return GridView.count(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.6,
                      shrinkWrap: true,
                      children: List.generate(
                        cubit.search.length,
                        (index) => SearchItem(
                          product: cubit.search[index],
                        ),
                      ),
                    );
                    }else{
                      return const Text("Search Here");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
