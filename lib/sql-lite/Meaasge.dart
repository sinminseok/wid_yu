class MessageFcm {
  int? id;
  String title;
  String body;
  bool isRead;

  MessageFcm({this.id, required this.title, required this.body, this.isRead = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'isRead': isRead ? 1 : 0,
    };
  }

  factory MessageFcm.fromMap(Map<String, dynamic> map) {
    return MessageFcm(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      isRead: map['isRead'] == 1,
    );
  }
}