import 'package:flutter/material.dart';
import 'package:thongtinttcuasv/screens/student_add.dart';
import 'models/student.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thongtinttcuasv/form_dangnhap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.black12),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Lê Văn A", "A1" ,"Nam","CNTT","Công ty Phần Mềm A", "2.5"),
    Student.withId(2, "Nguyễn Văn C","A2" , "Nam", "Ngoại Ngữ","Công ty TNHH ABC", "2.8"),
    Student.withId(3, "Nguyễn Anh Văn","B1" , "Nam","CNTT","Công ty Phần mềm Chiến lược", "3.0"),
    Student.withId(4, "Trương Tuấn D","B2" , "Nam","Ngoại Ngữ","Công ty Ngoại Ngữ Việt Nam", "3.25"),
    Student.withId(5, "Nguyễn Thanh E","C1" , "Nữ","Ngoại Ngữ","Công ty TNHH ABC", "3.1"),
    Student.withId(6, "Đỗ Thị G","C2" , "Nữ","Ngoại Ngữ","Công ty TNHH ZAM", "2.85"),
    Student.withId(7, "Lê Thị H","D1" , "Nữ","Ngoại Ngữ","Công ty TNHH BAM", "2.92"),
    Student.withId(8, "Thái Sơn","D2" , "Nam","Môi trường","Công ty TNHH Môi trường Tự nhiên", "2.91"),
    Student.withId(9, "Trần Công J","E" , "Nam","Kiến trúc","Công ty Kiến trúc Hawk", "3.0"),
  ];

  Object get selectedStudent => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("HỆ THỐNG QUẢN LÝ SINH VIÊN THỰC TẬP CỦA SINH VIÊN"),
            backgroundColor: Colors.blueAccent),
        body: buildBody());
  }
  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length  ,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      students[index].fullname +
                          " \nLớp: " +
                          students[index].lop +
                          " \nGiới tính: " +
                          students[index].gioitinh +
                          " \nKhoa: " +
                          students[index].nn +
                          " \nNơi thực tập: " +
                          students[index].thuctap,

                      style: TextStyle(color: Colors.black)),
                  subtitle: Text(
                      "Điểm GPA :  " +
                          students[index].diem.toString(),
                      style: TextStyle(color: Colors.red)),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5TQis6uDMi1qPX7FVVjZqsgMtAGvEmTOUVA&usqp=CAU"),
                  ),
                  // trailing: bulidStatusIcon(students[index].diem),

                  onLongPress: () {
                    print("Uzun basildi.");
                  },
                );
              }),
        ),

        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Add Sinh Viên",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)),).then((res) => setState((){}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.update,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Update Sinh Viên",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
                onPressed: () {
                  print("Guncelle");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Delete Sinh Viên",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
                onPressed: () {
                  students.remove(selectedStudent);
                  setState((){});
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget bulidStatusIcon(String diem) {
    if (diem == 50) {
      return Icon(Icons.done);
    } else if (diem == 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}

