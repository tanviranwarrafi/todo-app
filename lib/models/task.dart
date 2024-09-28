class Task {
  int id;
  String title;
  String description;
  String date;
  int status;

  Task({
    required this.title,
    required this.description,
    required this.date,
    required this.status,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'status': status,
    };
  }
}
