class Task {
  int id;
  String title;
  String description;
  String date;
  int status;

  Task({this.title, this.description, this.date, this.status, this.id});

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description, 'date': date, 'status': status};
  }
}
