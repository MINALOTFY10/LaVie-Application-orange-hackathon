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
                    SizedBox(height: 70,),
                    TextFormField(
                      readOnly: true,
                      onTap: () {

                      },
                      style: const TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 3.0,
                              style: BorderStyle.solid),
                        ),
                        contentPadding: EdgeInsets.only(left: 16, right: 16),
                        focusColor: const Color.fromRGBO(151, 151, 151, 1),
                        prefixIcon: Icon(Icons.search_rounded,
                          color: Color.fromRGBO(151, 151, 151, 1),),

                        fillColor: const Color.fromRGBO(248, 248, 248, 1),
                        filled: true,
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    const SizedBox(
                      height: 10.0,
                    ),

                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
