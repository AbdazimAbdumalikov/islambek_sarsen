import 'package:flutter/material.dart';

class SecondTable extends StatefulWidget {
  const SecondTable({Key? key}) : super(key: key);

  @override
  State<SecondTable> createState() => _SecondTableState();
}

class _SecondTableState extends State<SecondTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              //color: Color(0xFFD4E7FE),
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFD4E7FE),
                      Color(0xFFF0F0F0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 0.3])),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                        text: "Wed",
                        style: TextStyle(
                            color: Color(0XFF263064),
                            fontSize: 12,
                            fontWeight: FontWeight.w900),
                        children: [
                          TextSpan(
                            text: " 10 Oct",
                            style: TextStyle(
                                color: Color(0XFF263064),
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 8,
                          )
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://instagram.fala4-2.fna.fbcdn.net/v/t51.2885-15/322838504_514649457336071_6241818577883387294_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=instagram.fala4-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=hSs7qZ50Lg0AX8-kI_X&edm=ACWDqb8BAAAA&ccb=7-5&ig_cache_key=MzAwNTU5MDgyNDA4MTU5MDQ4Mw%3D%3D.2-ccb7-5&oh=00_AfAXMQRsPg1M7-1nLkHXob2hYcqFTEE3lJJXyrzyKK_CJQ&oe=6431C831&_nc_sid=1527a3"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Сәлем! Исламбек",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Color(0XFF343E87),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Мұнда кестенің тізімі берілген",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Тексеру керек...",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 185,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: MediaQuery.of(context).size.height - 245,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView(
                children: [
                  buildTitleRow("БҮГІНГІ САБАҚ", 3),
                  SizedBox(
                    height: 20,
                  ),
                  buildClassItem(),
                  buildClassItem(),
                  SizedBox(
                    height: 25,
                  ),
                  buildTitleRow("СІЗДІҢ МІНДЕТТЕРІҢІЗ", 4),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildTaskItem(
                            3, "Математика негіздері II", Colors.red),
                        buildTaskItem(3, "Информатика",
                            Colors.green),
                        buildTaskItem(3, "Биология",
                            Colors.green),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildTaskItem(int numDays, String courseTitle, Color color) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(12),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Мерзімі",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "$numDays күн қалды",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            child: Text(
              courseTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Row buildTitleRow(String title, int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: title,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "($number)",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
              ]),
        ),
        Text(
          "Барлығын көру",
          style: TextStyle(
              fontSize: 12,
              color: Color(0XFF3E3993),
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container buildClassItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "07:00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "AM",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  "Информатика",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Корпус Б, 2-ші қабат",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.ixbt.com/img/n1/news/2021/7/1/12-2_large.png"),
                    radius: 10,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Ақжол Аманат",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
