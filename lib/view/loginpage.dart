import 'package:flutter/material.dart';
import 'package:movie/view/nav_bar.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            width: maxWidth,
            height: maxHeight,
            child: Image.asset(
              'assets/images/login.webp',
              fit: BoxFit.fill,
            )),
        Container(
          color: Colors.red.withOpacity(0.5),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                    width: 320,
                    child: Image.asset(
                      'assets/images/104-1041752_the-kindness-diaries-on-netflix-netflix-logo-white-removebg-preview.png',
                      fit: BoxFit.fill,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '    John Doe',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '   johndoe@mail.com',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '   ********',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                },
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                      color: Color.fromRGBO(244, 67, 54, 2),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(260, 45),
                    backgroundColor: Color.fromARGB(243, 255, 255, 255)),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        'assets/images/fcb.png',
                        color: Colors.white,
                      ),
                    ),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        'assets/images/Untitled-removebg-preview.png',
                        color: Colors.white,
                      ),
                    ),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/google (1).png',
                        color: Colors.white,
                      ),
                    ),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'Already have an account?',
                style: TextStyle(
                    color: Color.fromARGB(140, 255, 255, 255), fontSize: 15),
              )
            ],
          ),
        )
      ],
    ));
  }
}
