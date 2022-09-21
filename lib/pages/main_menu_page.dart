import 'package:doctor_booking_app/data/list_doctor.dart';
import 'package:doctor_booking_app/shared/theme.dart';
import 'package:doctor_booking_app/widgets/dokter_card.dart';
import 'package:doctor_booking_app/widgets/dokter_tile.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "dr. Adam",
      "spesialis": "Dokter Umum",
      "imageUrl": 'assets/image_doctor1.jpg',
      "rating": 4.9.toDouble(),
      "price": 27.toDouble(),
    },
    {
      "id": 2,
      "name": "dr. Albert Sp.PD",
      "spesialis": "Spesialis Penyakit Dalam",
      "imageUrl": 'assets/image_doctor2.jpg',
      "rating": 4.9.toDouble(),
      "price": 12.toDouble(),
    },
    {
      "id": 3,
      "name": "dr. Natasha Sp.THT",
      "spesialis": "Spesialis THT",
      "imageUrl": 'assets/image_doctor3.jpg',
      "rating": 4.8.toDouble(),
      "price": 17.toDouble(),
    },
    {
      "id": 4,
      "name": "dr. Indah Sp.U",
      "spesialis": "Spesialis Urologi",
      "imageUrl": 'assets/image_doctor4.jpg',
      "rating": 4.8.toDouble(),
      "price": 9.toDouble(),
    },
    {
      "id": 5,
      "name": "dr. Citra Sp.BF",
      "spesialis": "Spesialis Bedah Saraf",
      "imageUrl": 'assets/image_doctor5.jpg',
      "rating": 4.5.toDouble(),
      "price": 8.toDouble(),
    },
    {
      "id": 6,
      "name": "dr. Fajar Sp.B",
      "spesialis": "Spesialis Bedah",
      "imageUrl": 'assets/image_doctor6.jpeg',
      "rating": 4.4.toDouble(),
      "price": 21.toDouble(),
    },
    {
      "id": 7,
      "name": "dr. Marsya Sp.KJ",
      "spesialis": "Spesialis Kedokteran Jiwa",
      "imageUrl": 'assets/image_doctor7.png',
      "rating": 4.3.toDouble(),
      "price": 18.toDouble(),
    },
    {
      "id": 8,
      "name": "dr. Dinda Sp.M",
      "spesialis": "Spesialis Mata",
      "imageUrl": 'assets/image_doctor8.png',
      "rating": 4.4.toDouble(),
      "price": 7.toDouble(),
    },
  ];

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else if (enteredKeyword == "All Doctor") {
      results = _allUsers.toList();
    } else {
      results = _allUsers
          .where((user) => user["spesialis"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: defaultMargin,
            bottom: 14,
          ),
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    child: Text(
                      "Hello, Alvito Aditya",
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Stay Healthy with Our Spesialis Doctor',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
            Container(
                child: Stack(children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kWhiteColor,
                      width: 4,
                    ),
                    image: DecorationImage(
                        // image: DecorationImage( image: true ? NetworkImage('someNetWorkLocation.com') : AssetImage('assets/images/noImageAvailable.png') as ImageProvider ),
                        image: (AssetImage("assets/user_pic.png")
                            as ImageProvider),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ]))
          ]));
    }

    Widget listCategories() {
      Widget categories(int index, String title) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            margin: EdgeInsets.only(right: 16, bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: selectedIndex == index ? kBlueColor : Colors.transparent,
              border: Border.all(
                color: selectedIndex == index ? kBlueColor : kGreyColor,
              ),
            ),
            child: Text(
              title,
              style: selectedIndex == index
                  ? whiteTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    )
                  : greyTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
            ),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              categories(0, 'All Doctor'),
              categories(1, 'Umum'),
              categories(2, 'THT'),
              categories(3, 'Penyakit Dalam'),
              categories(4, 'Urologi'),
              categories(5, 'Bedah'),
              categories(6, 'Bedah Saraf'),
              categories(7, 'Jiwa'),
              categories(8, 'Mata'),
            ],
          ),
        ),
      );
    }

    Widget searchDestination() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: kGreyColor,
                size: 36.0,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Find a Profesional Doctor',
                style: greyTextStyle,
              ),
            ],
          ),
        ),
      );
    }

    Widget recommendedTitle() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 14),
        child: Text(
          'Recommended',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget recommendedDoctor() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 24),
            Row(
              children: doktor
                  .map(
                    (doktor) => DokterCard(doktor),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    }

    Widget doctorTitle() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 14, defaultMargin, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                'Doctor for You',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 18,
                ),
              ),
            ),
            Icon(
              Icons.fiber_manual_record,
              size: 26,
              color: kBlueColor,
            ),
            Icon(
              Icons.fiber_manual_record,
              size: 26,
              color: kBlueColor,
            ),
          ],
        ),
      );
    }

    Widget DoctorTile() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: doktor
              .map(
                (doktor) => DokterTile(doktor),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              searchDestination(),
              listCategories(),
              recommendedTitle(),
              recommendedDoctor(),
              doctorTitle(),
              DoctorTile(),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
