import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          alignment: Alignment.topCenter,
          color: Color(0xFFF0F0F0),
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.grey),
                  SizedBox(
                    width: 15,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Сәуір",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF263064),
                          fontSize: 22,
                        ),
                        children: [
                          TextSpan(
                            text: " 2023",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Text(
                "Бүгін",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF3E3993),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 100,
          child: Container(
            height: MediaQuery.of(context).size.height - 160,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 30),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildDateColumn("Жұма", 7, false),
                      buildDateColumn("Сенбі", 8, false),
                      buildDateColumn("Жексенбі", 9, false),
                      buildDateColumn("Дүйсенбі", 10, true),
                      buildDateColumn("Сейсенбі", 11, false),
                      buildDateColumn("Сәрсенбі", 12, false),
                      buildDateColumn("Бейсенбі", 13, false),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildTaskListItem(),
                        buildTaskListItem(),
                        buildTaskListItem(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Container buildTaskListItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 15,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(5),
                    )),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "07:00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " AM",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            )
                          ]),
                    ),
                    Text(
                      "1 сағ 45 мин",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 185,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(right: 10, left: 30),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ифнорматика",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Робототехника",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 9,
                      backgroundImage: NetworkImage(
                          "https://instagram.fala4-2.fna.fbcdn.net/v/t51.2885-15/322838504_514649457336071_6241818577883387294_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=instagram.fala4-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=hSs7qZ50Lg0AX8-kI_X&edm=ACWDqb8BAAAA&ccb=7-5&ig_cache_key=MzAwNTU5MDgyNDA4MTU5MDQ4Mw%3D%3D.2-ccb7-5&oh=00_AfAXMQRsPg1M7-1nLkHXob2hYcqFTEE3lJJXyrzyKK_CJQ&oe=6431C831&_nc_sid=1527a3"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Исламбек Сәрсен",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "777-077-0707",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ЕНУ & Корпус А",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "354 аудитория",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildDateColumn(String weekDay, int date, bool isActive) {
    return Container(
      decoration: isActive
          ? BoxDecoration(
          color: Color(0xff402fcc), borderRadius: BorderRadius.circular(10))
          : BoxDecoration(),
      height: 55,
      width: 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            weekDay,
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          Text(
            date.toString(),
            style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}