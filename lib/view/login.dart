import 'package:final_uji_kom/services/auth-services.dart';
import 'package:final_uji_kom/view/home.dart';
import 'package:final_uji_kom/view/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_uji_kom/shared/shared.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController(),
      passController = TextEditingController();

  Firebase_Auth Auth = Firebase_Auth();

  void login() async {
    String _email = emailController.text, _pass = passController.text;

    var isAuth = await Auth.login(email: _email, password: _pass);

    if (_email.isEmpty || _pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Username Dan Password Tidak Boleh Kosong!"),
        ),
      );
      return;
    }

    AlertDialog alert = AlertDialog(
      title: Text("Berhasil Login"),
      content: Container(
        child: Text("Selamat datang"),
      ),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          ),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: fieldTextStyle.copyWith(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 180,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: emailController,
                  style: TextStyle(
                    color: primaryColor,
                  ),
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.email,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: passController,
                  style: TextStyle(
                    color: primaryColor,
                  ),
                  cursorColor: primaryColor,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.lock,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "Login",
                    style: buttonTextStyle.copyWith(
                        color: whiteColor, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(left: 90)),
                  Text(
                    "Belum Punya akun?",
                    style: buttonTextStyle.copyWith(
                        fontSize: 15, color: blackColor),
                  ),
                  GestureDetector(
                    child: Text(
                      " Register",
                      style: buttonTextStyle.copyWith(
                          fontSize: 15, color: Colors.blue),
                    ),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      ),
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
