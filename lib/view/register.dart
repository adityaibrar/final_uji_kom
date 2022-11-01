import 'package:final_uji_kom/services/auth-services.dart';
import 'package:final_uji_kom/view/login.dart';
import 'package:flutter/material.dart';
import 'package:final_uji_kom/shared/shared.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController(),
      passController = TextEditingController(),
      namaController = TextEditingController(),
      nomerController = TextEditingController();

  Firebase_Auth Auth = Firebase_Auth();

  void register() async {
    String _email = emailController.text,
        _password = passController.text,
        _nama = namaController.text,
        _nomer = nomerController.text;

    var isRegister = await Auth.register(
        email: _email, password: _password, nama: _nama, nomer: _nomer);

    if (_email.isEmpty || _password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Email dan password tidak boleh kosong!"),
        ),
      );
      return;
    }
    if (!isRegister) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Gagal Register"),
        ),
      );
      return;
    }

    AlertDialog alert = AlertDialog(
      title: Text("Berhasil Registrasi"),
      content: Container(
        child: Text("Selamat data anda berhasil disimpan"),
      ),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Loginpage())),
        )
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
          "Register",
          style: fieldTextStyle.copyWith(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
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
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                  style: TextStyle(color: primaryColor),
                  cursorColor: primaryColor,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
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
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: namaController,
                  style: TextStyle(color: primaryColor),
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: primaryColor,
                    )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Nama',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.person,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: nomerController,
                  style: TextStyle(color: primaryColor),
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: primaryColor,
                    )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Nomer Handphone',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.smartphone_rounded,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: primaryColor),
                    onPressed: () {
                      register();
                    },
                    child: Text(
                      "Save",
                      style: buttonTextStyle.copyWith(
                          color: whiteColor, fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
