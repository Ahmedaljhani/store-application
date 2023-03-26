import 'package:first_class/main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20),
                child: Card(
                  elevation: 4,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 4,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // TODO: Validate the email and password against your authentication system
                      // If valid, navigate to the home screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTest extends StatefulWidget {
  LoginTest({Key? key}) : super(key: key);

  @override
  State<LoginTest> createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool passordState = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     // PopupMenuButton(
      //     //   itemBuilder: (context) {
      //     //     return [
      //     //       PopupMenuItem(
      //     //         value: 1,
      //     //         child: Row(
      //     //           children: [
      //     //             Icon(
      //     //               Icons.settings,
      //     //               color: Colors.black,
      //     //             ),
      //     //             Text(" Setting", style: TextStyle(fontSize: 22))
      //     //           ],
      //     //         ),
      //     //       ),
      //     //       PopupMenuItem(
      //     //         value: 2,
      //     //         child: Row(
      //     //           children: [Text(" About ", style: TextStyle(fontSize: 22))],
      //     //         ),
      //     //       )
      //     //     ];
      //     //   },
      //     //   onSelected: (value) {
      //     //     if (value == 1) {
      //     //       print("valu 1");
      //     //     }
      //     //     if (value == 2) {
      //     //       print("valu 2");
      //     //     }
      //     //   },
      //     // ),
      //   ],
      // ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Login",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Please sign in to continue",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold),),
              ),SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Card(
                  elevation: 4,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter Your Email",
                      prefixIcon: Icon(Icons.email),
                      // border: OutlineInputBorder(),
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (email) {
                      if (email?.isEmpty == true) {
                        return "Email can't be empty";
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Card(
                  elevation: 4,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter Your Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            passordState = !passordState;
                            setState(() {});
                          },
                          icon: passordState
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                      // border: OutlineInputBorder(),
                    ),
                    controller: passwordController,
                    obscureText: passordState,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    validator: (password) {
                      if (password?.isEmpty == true) {
                        return "Password can't be empty";
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                    onPressed: () {
                      print("the email is ${emailController.text}");
                      print("the password  is $passwordController");
                      // formKey.currentState?.validate();
                      if (formKey.currentState?.validate() == true) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
