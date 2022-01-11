import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MyApp12 extends StatelessWidget {
  const MyApp12({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MetarialApp',
      home: FormBasic(),
    );
  }
}
class FormBasic extends StatefulWidget {
  const FormBasic({key}) :super(key: key);

  @override
  _FormBasicState createState() => _FormBasicState();


}
class _FormBasicState extends State<FormBasic>{
  var fKey = GlobalKey<FormState>();
  var txtTenDangNhap = TextEditingController();
  var txtMatKhau = TextEditingController();
  var txtNhapLaiMatKhau = TextEditingController();
  var txtSoDienThoai = TextEditingController();
  var txtEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: fKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: Column(
            children: [
              SizedBox(height: 100,),

              Text("ĐĂNG NHẬP", style: TextStyle(fontSize: 35, color: Colors.red),),
              TextFormField(
                controller: txtTenDangNhap,
                validator: (value){
                  if (value == null || value.isEmpty)
                    return "Vui lòng nhập tên đăng nhập";
                  else
                    return null;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Tên đăng nhập",
                    labelText: "Tên đăng nhập (*)"
                ),
              ),

              TextFormField(
                controller: txtMatKhau,
                validator: (value){
                  if (value == null || value.isEmpty)
                    return "Vui lòng nhập mật khẩu";
                  else if (value.length < 6)
                    return  "Mật khẩu dài ít nhất là 6 ký tự";
                  else
                    return null;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.lock_open),
                    hintText: "Nhập mật khẩu",
                    labelText: "Mật khẩu (*)"
                ),

              ),


              ElevatedButton(
                onPressed: (){
                  if (fKey.currentState.validate()){
                    var tenDangNhap = txtTenDangNhap.text;
                    var matKhau = txtMatKhau.text;
                    var nhaplaimatKhau = txtNhapLaiMatKhau.text;
                    var sodienthoai = txtSoDienThoai.text;
                    var email = txtEmail.text;

                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        content: Text("Đăng nhập thành công!"),
                      );
                    });
                    print("Ok, ${tenDangNhap}, ${matKhau}}");
                  }
                  else
                    print("Not pass");

                },
                child: Text("Đăng Nhập"),
              ),
            ],
          ),

        ),
      ),

    );
  }
}
