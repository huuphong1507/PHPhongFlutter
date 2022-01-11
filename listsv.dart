class Student {
  String fullname, lop, gioitinh, status, nn, thuctap, diem;

  Student(String fullname, String lop, String gioitinh,String nn,String thuctap, String diem) {
    this.fullname = fullname;
    this.lop = lop;
    this.gioitinh = gioitinh;
    this.diem = diem;
    this.nn = nn;
    this.thuctap = thuctap;
  }
}

void main() {
  List<Student> students = <Student>[
    Student("A", "B", "","", "", ""),
    Student("C", "D", "","", "", ""),
    Student("E", "F","","", "", ""),
    Student("G", "Z","","", "", "")
  ];

  for (var i = 0; i < students.length; i++) {
    print(students[i].fullname + " " + students[i].lop + " " + students[i].gioitinh + " " + students[i].nn + " "+ students[i].thuctap + " " + students[i].diem.toString());
  }

  print(" Update ");
  students[2] = Student("", "","","", "", "");

  for (var i = 0; i < students.length; i++) {
    print(students[i].fullname + " " + students[i].lop + " " + students[i].gioitinh + " " + students[i].nn + " "+ students[i].thuctap + " " + students[i].diem.toString());
  }


  print(" Delete ");
  students.removeAt(1);

  for (var i = 0; i < students.length; i++) {
    print(students[i].fullname + " " + students[i].lop + " " + students[i].gioitinh + " " + students[i].nn + " "+ students[i].thuctap + " " + students[i].diem.toString());
  }
}
