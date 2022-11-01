import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_uji_kom/shared/shared.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _namaController = TextEditingController();
  String nama = '';
  String phone = '';

  List<String> docIDs = [];

  Future getDocId() async {
    var result = await _firebaseFirestore
        .collection('user_details')
        .where('uid', isEqualTo: user?.uid)
        .get();
    setState(() {
      nama = result.docs[0]['Nama'];
      phone = result.docs[1]['Phone'];
    });
  }

  @override
  void initState() {
    super.initState();
    getDocId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: fieldTextStyle.copyWith(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(phone),
                TextFormField(
                  controller: _namaController..text = user!.displayName!,
                ),
                Text(user?.email ?? 'Unknown'),
                Text(nama),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: primaryColor),
                    onPressed: () {
                      user?.updateDisplayName(_namaController.text);
                    },
                    child: Text('edit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
