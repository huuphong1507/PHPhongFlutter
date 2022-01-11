import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:thongtinttcuasv/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State <StudentAdd>{

  var formKey = GlobalKey<FormState>();

  Student student = Student("", "", "","", "", "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HỆ THỐNG QUẢN LÝ SINH VIÊN THỰC TẬP CỦA SINH VIÊN"),
        ),
        body: Container(
          //form olusturuyoruz
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFullNameField(),
                buildLopField(),
                buildGioiTinhField(),
                buildNNField(),
                buildttField(),
                buildDiemField(),
                buildSubmitButton()
              ],
            ),
          ),
        )
      //Center(child: Text("Yeni Ogrenci"),),
    );
  }

  buildFullNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Họ và tên", hintText: ""),
      onSaved: (String value) {
        student.fullname = value;
      },
    );
  }
  buildLopField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Lớp", hintText: ""),
      onSaved: (String value) {
        student.lop = value;
      },
    );
  }

  buildGioiTinhField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Giới tính", hintText: ""),
      onSaved: (String value) {
        student.gioitinh = value;
      },
    );
  }
  buildNNField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ngành học", hintText: ""),
      onSaved: (String value) {
        student.nn = value;
      },
    );
  }
  buildttField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Nơi thực tập", hintText: ""),
      onSaved: (String value) {
        student.thuctap = value;
      },
    );
  }

  buildDiemField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Điểm GPA", hintText: ""),
      onSaved: (String value) {
        student.diem = value;
      },
    );
  }

  Widget buildSubmitButton(){
    return RaisedButton(
      child:
          Text("Sửa", style: TextStyle(color: Colors.red)),
      onPressed: (){
        formKey.currentState.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }

}