import 'package:flutter/material.dart';
import 'student.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Student> people = [
      Student(
        name: "จักพรรดิ์ อนุไพร",
        image: 'images/D.jpg',
        id: "643450065-4",
        studentId: "643450065-4",
        aboutMe: "Birthday 16 JAN 2003",
        email: "chakkapad.a@kkumail.com",
        socialMedia: "https://www.facebook.com/profile.php?id=100011799663716&locale=th_TH",
      ),
      Student(
        name: "นริศรา วงค์บุตรศรี",
        image: 'images/may.jpg',
        id: "643450328-8",
        studentId: "643450328-8",
        aboutMe: "Birthday 27 DEC 2002",
        email: "naritsara.w@kkumail.com.com",
        socialMedia: "https://www.facebook.com/may.ooy27?locale=th_TH",
      ),
      Student(
        name: "วรรณภา เบ้านาค",
        image: 'images/nim.jpg',
        id: "643450330-1",
        studentId: "643450330-1",
        aboutMe: "Birthday 17 FEB 2003",
        email: "wannapa.ba@kkumail.com",
        socialMedia: "https://www.facebook.com/Wannapa177?locale=th_TH",
      ),
      Student(
        name: "อฆพร ไร่ขาม",
        image: 'images/m.jpg',
        id: "643450334-3",
        studentId: "643450334-3",
        aboutMe: " 14 FEB 2002",
        email: "akapron.r@kkumail.com",
        socialMedia: "https://www.facebook.com/akaporn.raikham/?locale=th_TH",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: const Text(
            "My Flutter App",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(data: people[index]),
                ),
              );
            },
            child: displayNameItem(
              name: people[index].name,
              imagePath: people[index].image,
            ),
          );
        },
      ),
    );
  }

  Widget displayNameItem({required String name, required String imagePath}) {
    bool isHighlight = name == "วรรณภา เบ้านาค";
    return Container(
      padding: const EdgeInsets.all(10),
      color:
          isHighlight ? Color.fromARGB(255, 61, 158, 171) : Colors.transparent,
      child: Row(
        children: [
          ClipOval(
            child: Image(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              image: AssetImage(imagePath),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
              color: isHighlight
                  ? Color.fromARGB(255, 237, 241, 237)
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
