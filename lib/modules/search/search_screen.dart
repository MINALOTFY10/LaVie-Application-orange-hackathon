import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components.dart';
import 'cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    defaultFormField(
                      controller: searchController,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'enter text to search';
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // if (state is SearchSuccessState)
                      // Expanded(
                      //   child: ListView.separated(
                      //     itemBuilder: (context, index) => buildListProduct(
                      //       SearchCubit.get(context).model.data.data[index],
                      //       context,
                      //       isOldPrice: false,
                      //     ),
                      //     separatorBuilder: (context, index) => myDivider(),
                      //     itemCount:
                      //     SearchCubit.get(context).model.data.data.length,
                      //   ),
                      // ),

                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
