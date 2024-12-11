import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'noservices/nodaycare.dart';
import 'noservices/nogrooming.dart';
import 'noservices/notoys.dart';
import 'noservices/notraining.dart';
import 'noservices/novet.dart';
import 'servicepick.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  SelectServiceState createState() => SelectServiceState();
}

class SelectServiceState extends State<Services> {
  List servicesIcon = [
    'https://cdn-icons-png.flaticon.com/512/3636/3636098.png',
    'https://cdn-icons-png.flaticon.com/512/3900/3900358.png',
    'https://cdn-icons-png.flaticon.com/512/7810/7810417.png',
    'https://cdn-icons-png.flaticon.com/512/3047/3047928.png',
    'https://cdn-icons-png.flaticon.com/512/1130/1130964.png',
    'https://cdn-icons-png.flaticon.com/512/2365/2365014.png',
  ];
  List servicesTitle = [
    'Grooming',
    'Training',
    'Boarding',
    'Day Care',
    'Toys',
    'Vet'
  ];

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: Text(
                "Find the right caretaker for your pet",
                style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              child: Lottie.asset(
                'assets/images/kimkim.json',
                width: 300,
                repeat: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: servicesIcon.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          //Groom
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Nogrooming()),
                          );
                          break;
                        case 1:
                          //Training
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notraining()),
                          );
                          break;
                        case 2:
                          //Boarding
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ServicePick()),
                          );
                          break;
                        case 3:
                          //Day care
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Nodaycare()),
                          );
                          break;
                        case 4:
                          //Toys
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notoys()),
                          );
                          break;
                        case 5:
                          //Vet
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Novet()),
                          );
                          break;
                      }
                    },
                    child: serviceContainer(
                      servicesTitle[index],
                      servicesIcon[index],
                      index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  serviceContainer(String name, String image, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: selectedService == index ? Colors.white : Colors.grey.shade300,
        border: Border.all(
          color: selectedService == index
              ? Colors.grey.withOpacity(1)
              : Colors.white.withOpacity(1),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: NetworkImage(image),
            height: 45,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: GoogleFonts.rubik(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
