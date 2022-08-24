import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void SnackbarMessage(context, String text,bool success) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text,style: TextStyle(fontSize: 18),),
    duration: const Duration(milliseconds: 3000),
    backgroundColor: success ?  Color.fromRGBO(26, 188, 0, 1) : Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: 2,left: 2,right: 2),
  ));
}

Widget myDivider() => const SizedBox(
  width: double.infinity,
  height: 10,
);

Widget defaultFormField({
  required TextEditingController controller,
  bool isPassword = false,
  required String? Function(String?)? validate,

}) =>
    TextFormField(
      controller: controller,

      obscureText: isPassword,
      validator: validate,
      decoration: InputDecoration(

        contentPadding:
        const EdgeInsets.fromLTRB(
            15, 0, 0, 0),
        focusColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(5),
          borderSide: const BorderSide(
              color: Color.fromRGBO(
                  147, 147, 147, 1),
              style: BorderStyle.solid),
        ),
        focusedBorder:
        OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(
              5.0),
          borderSide: const BorderSide(
              color: Color.fromRGBO(
                  147, 147, 147, 1),
              style: BorderStyle.solid),
        ),
      ),
    );


Widget defaultLoginButton({
  required String text,
  required Function function,

}) =>
    Container(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: function(),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(
              26, 188, 0, 1),
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(
                5.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15,
              fontWeight:
              FontWeight.w500),
        ),
      ),
    );


Widget signUpScreenWidget(loginKey,
    firstNameController,
    lastNameController,
    emailController,
    passwordController,
    confirmPasswordController,
    cubit,
    context){
  return Padding(
    padding:
    const EdgeInsets.only(left: 41, right: 41),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40,),
        Form(
          key: loginKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 93,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: const Text("First Name", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1),fontSize: 14),),
                            ),
                          ),
                          const SizedBox(width: 17,),
                          Expanded(
                            child: Container(child: const Text("Last Name", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1),fontSize: 14),)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7,),
                      Row(
                        children: [
                          Expanded(
                            child:  defaultFormField(
                                controller: firstNameController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                }),
                          ),
                          const SizedBox(width: 17,),
                          Expanded(
                            child:  defaultFormField(
                                controller: lastNameController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                const Text("E-mail", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1), fontSize: 14),),
                const SizedBox(height: 7,),

                defaultFormField(
                    controller: emailController,
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
                    controller: passwordController,
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

                const SizedBox(height: 25,),
                const Text("Confirm Password", style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1), fontSize: 14),),
                const SizedBox(height: 7,),

                defaultFormField(
                    controller: confirmPasswordController,
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
                Container(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      if (loginKey.currentState!.validate()) {
                        cubit.signUP(firstNameController.text, lastNameController.text, emailController.text, passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: const Color.fromRGBO(26, 188, 0, 1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
                    ),
                    child: const Text("Login",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w500),
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
                const SizedBox(
                  height: 3,
                ),
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
  );
}




//===============================================================================================================
