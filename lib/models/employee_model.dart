class Employee {
  String emp_id;
  String emp_name;
  String job_name;
  int hiring_year;
  int salary;
  String img_url;
  Employee(
      {required this.emp_name,
      required this.emp_id,
      required this.hiring_year,
      required this.img_url,
      required this.job_name,
      required this.salary});
  factory Employee.fromMap(Map<String, dynamic> parsedJson) {
    return Employee(
        emp_name: parsedJson["emp_name"],
        emp_id: parsedJson["emp_id"],
        hiring_year: parsedJson["hiring_year"],
        img_url: parsedJson["img_url"],
        job_name: parsedJson["job_name"],
        salary: parsedJson["salary"]);
  }
}
