// class Transaction {
//   final String id;
//   final String title;
//   final double value;
//   final DateTime date;

//   Transaction({
//     required this.id,
//     required this.title,
//     required this.value,
//     required this.date,
//   });
// }

class Transaction {
  late final String id;
  late final String title;
  late final double value;
  late final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    value = json['value'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['value'] = this.value;
    data['date'] = this.date;
    return data;
  }
}
