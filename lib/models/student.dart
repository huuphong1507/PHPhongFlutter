class Student {
  int id;
  String fullname, lop,diem, gioitinh, status, nn, thuctap;

  Student(String fullname,String lop, String gioitinh,String nn,String thuctap, String diem) {
    this.fullname = fullname;
    this.lop = lop;
    this.gioitinh = gioitinh;
    this.diem = diem;
    this.nn = nn;
    this.thuctap = thuctap;
  }
  Student.withId(int id, String fullname,String lop, String gioitinh,String nn,String thuctap, String diem) {
    this.id = id;
    this.fullname = fullname;
    this.lop = lop;
    this.gioitinh = gioitinh;
    this.diem = diem;
    this.nn = nn;
    this.thuctap = thuctap;
  }

  String get getStatus {
    String message = "";
    if (this.diem == 50) {
      message = "";
    } else if (this.diem == 40) {
      message = "";
    } else {
      message = "";
    }
    this.status = message;
    return this.status;
  }
}
