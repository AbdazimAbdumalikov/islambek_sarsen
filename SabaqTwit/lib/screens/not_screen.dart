import 'package:flutter/material.dart';

class NotificationScreenOne extends StatefulWidget {
  const NotificationScreenOne({Key? key}) : super(key: key);

  @override
  State<NotificationScreenOne> createState() => _NotificationScreenOneState();
}

class _NotificationScreenOneState extends State<NotificationScreenOne> {
  final List<Map<String, dynamic>> notifications = [
    {
      'avatar': 'https://okna.hse.ru/pubs/share/direct/539769638.jpg',
      'name': 'Ақжол Аманат (математика)',
      'text': 'Үй жұмысын қайта қарап шығып, қайта жіберініз',
      'time': DateTime.now(),
    },
    {
      'avatar': 'https://spb.hse.ru/data/2020/09/16/1583072458/7.jpg',
      'name': 'Арман Мақсатбай (фиология)',
      'text': 'Сіз бүгінгі сабақты қалдырдыныз!',
      'time': DateTime.now(),
    },
    {
      'avatar': 'https://zhaikpress.kz/wp-content/oraloniri/news/img/2023/03/luchshie-prepodavateli-vuza-2.jpg',
      'name': 'Жанарыс Ұлықбекұлы (география)',
      'text': 'Сіз ертен сағат 15.00 ге дейін тест тапсыруыныз міндетті!',
      'time': DateTime.now(),
    },
    {
      'avatar': 'https://hse.kazguu.kz/wp-content/uploads/2019/03/photo5190949387671546538.jpg',
      'name': 'Алия Уланова (биология)',
      'text': 'Сіздің үлгерімініз тамаша!',
      'time': DateTime.now(),
    },
    {
      'avatar': 'https://www.ixbt.com/img/n1/news/2019/11/6/Capture_0_large.JPG',
      'name': 'John Doe',
      'text': 'You have a new message',
      'time': DateTime.now(),
    },
    {
      'avatar': 'https://www.ixbt.com/img/n1/news/2022/0/5/6c5824d1f6a3f385f618ba78e6b95e3af9ff421b_large.jpg',
      'name': 'Қасымжан Тоқтар (әдебиет)',
      'text': 'Сізге үй тапсырмалары жіберілді',
      'time': DateTime.now(),
    },
    {
      'avatar': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/%D0%A2%D0%B8%D0%BC_%D0%9A%D1%83%D0%BA_%2802-09-2021%29.jpg/250px-%D0%A2%D0%B8%D0%BC_%D0%9A%D1%83%D0%BA_%2802-09-2021%29.jpg',
      'name': 'John Doe',
      'text': 'You have a new message',
      'time': DateTime.now(),
    },
    {
      'avatar': 'https://example.com/avatar1.png',
      'name': 'John Doe',
      'text': 'You have a new message',
      'time': DateTime.now(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Хабарландырулар'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(notification['avatar']),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        notification['name'],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        notification['text'],
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '${notification['time'].hour}:${notification['time'].minute}',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
