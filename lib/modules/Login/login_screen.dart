import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planetapp/layout/laVieApp/laVie_layout.dart';
import '../../shared/components.dart';
import '../../shared/network/local/cache_helper.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {


  var signUpEmailController = TextEditingController();
  var signUpPasswordController = TextEditingController();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var loginEmailController = TextEditingController();
  var loginPasswordController = TextEditingController();
  var loginConfirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  late TabController _tabController;

  final List<Widget> myTabs = [
    const Tab(
      child: Text(
        "Sign up",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    ),
    const Tab(
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    )
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
          listener: (BuildContext context, LoginState state) {
            if (state is LoginSuccessState) {
             SnackbarMessage(context, "Logged in Successfully",true);
             Navigator.push (
               context,
               MaterialPageRoute (
                 builder: (context) => AppLayout(),
               ),
             );
              // CacheHelper.saveData(
              //   key: 'token',
              //   value: LoginCubit.get(context).data.accessToken
              // ).then((value)
              // {
              //   // token = state.loginModel.data.token;
              //   Navigator.push (
              //     context,
              //     MaterialPageRoute (
              //       builder: (context) => AppLayout(),
              //     ),
              //   );
              // });
          }
            if(state is LoginErrorState){
            SnackbarMessage(context, "Incorrect Email or Password",false);
             // print('wrong');
            }
          },
            builder: (BuildContext context, LoginState state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
              body: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/image 68 (Traced).png"),
              ],
            ),
            Image.asset("assets/Group 1000003302.png"),
            Expanded(
              child: SingleChildScrollView(
                //physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    TabBar(
                      controller: _tabController,
                      padding: const EdgeInsets.all(0.0),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3,
                      unselectedLabelColor:
                          const Color.fromRGBO(138, 138, 138, 1),
                      indicatorColor: const Color.fromRGBO(26, 188, 0, 1),
                      labelColor: const Color.fromRGBO(26, 188, 0, 1),
                      tabs: myTabs,
                    ),
                    Center(
                      child: [
                        loginScreenWidget(
                            formKey,
                            firstNameController,
                            lastNameController,
                            loginEmailController,
                            loginPasswordController,
                            loginConfirmPasswordController,
                            cubit,
                            context),
                    Padding(
                    padding:
                    const EdgeInsets.only(left: 41, right: 41),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1), fontSize: 14),),
                            const SizedBox(height: 7),

                            defaultFormField(
                                controller: signUpEmailController,
                                validate: (String? value) {
                                  bool validEmail = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value.toString());
                                  if (value!.isEmpty) {
                                    return 'Please enter Your email';
                                  } else if (!validEmail) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                }),

                            const SizedBox(height: 25,),
                            const Text("Password", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1), fontSize: 14),),
                            const SizedBox(height: 7,),

                            defaultFormField(
                                controller: signUpPasswordController,
                                validate: (String? value) {
                                  bool validPassword = RegExp(
                                      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}$")
                                      .hasMatch(value.toString());
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (!validPassword) {
                                    return "The password is too weak";
                                  }
                                  return null;
                                }),

                            const SizedBox(height: 35,),
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              fallback: (context)  => Center(child: CircularProgressIndicator(color: Color.fromRGBO(26, 188, 0, 1),),),
                              builder: (context) => Container(
                                width: double.infinity,
                                height: 46,
                                child: ElevatedButton(
                                  onPressed: () {

                                    if (formKey.currentState!.validate()) {
                                      cubit.signIn(signUpEmailController.text, signUpPasswordController.text);
                                    }

                                            },
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color.fromRGBO(
                                        26, 188, 0, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          5.0),
                                    ),
                                  ),
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight:
                                        FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8),
                                child:
                                Row(children: const <Widget>[
                                  Expanded(
                                      child: Divider(
                                        height: 55,
                                        color: Color.fromRGBO(
                                            151, 151, 151, 1),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Text(
                                      "or continue with",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              151, 151, 151, 1)),
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                        height: 55,
                                        color: Color.fromRGBO(
                                            151, 151, 151, 1),
                                      )),
                                ])),
                            const SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                        "assets/Google.png")),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                        "assets/Facebook.png")),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),

                      ][_tabController.index],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/image 68 (Traced)2.png"),
              ],
            ),
          ]));
        });
  }
}
