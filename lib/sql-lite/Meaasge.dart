import 'package:intl/intl.dart';

class MessageFcm {
  int? id;
  String title;
  String body;
  bool isRead;
  String dateTime;

  MessageFcm({this.id, required this.title, required this.body, this.isRead = false, required this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'isRead': isRead ? 1 : 0,
      'dateTime' : DateTime.now().toString()
    };
  }

  // 날짜를 "9월 12일 15:30" 형식으로 반환하는 메서드
  // 날짜를 "9월 12일 15:30" 형식으로 반환하는 메서드
  String formatDateTime() {
    // String을 DateTime 객체로 변환
    final DateTime parsedDateTime = DateTime.parse(dateTime);

    // 변환된 DateTime을 원하는 형식으로 포맷
    final DateFormat formatter = DateFormat('M월 d일 HH:mm');
    return formatter.format(parsedDateTime);
  }


  factory MessageFcm.fromMap(Map<String, dynamic> map) {
    return MessageFcm(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      isRead: map['isRead'] == 1, dateTime: map['dateTime'],
    );
  }

  // title 검사 메서드
  int checkTitle() {
    print(title);
    if (title.contains("오늘 목표를 모두")) {
      return 2;
    } else if (title.contains('수행할 시간이에요.')) {
      return 0;
    }
    else if(title.contains("수행하셨어요.")){
      return 1;
    }
    else if(title.contains("을 하지 않았어요.")){
      return -1;
    }
    else if(title.contains("건강 수치가 평소와 달라요!")){
      return -2;
    }
    return -1;  // 해당되는 내용이 없을 경우
  }
}