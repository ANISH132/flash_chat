import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/roundedbutton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  //Animation Controller
  late AnimationController controller ;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this ,
      duration: Duration(seconds: 1),
      // upperBound: 100,
    );

   // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);

    controller.forward();  // end is completed

    //controller.reverse(from: 1.0);  end is 'dismissed'

    // animation.addStatusListener((status) {
    //   // print(status);
    //   if (status == AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   }else if (status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    //
    // });

    controller.addListener(() {

      setState(() {  });
      // print(animation.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Center(
          child: Row(
          children: <Widget>[
                 Hero(
                   tag: 'logo',
                   child: Container(
                    child: Image.asset('images/logo.png'),
                    height:  60.0,

                ),
                 ),

          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
                color: Colors.teal,
              ),
              child: AnimatedTextKit(
                   animatedTexts: [TypewriterAnimatedText('Flash Chat')],
                  ),
            ),
          ),
              ],
            ),
        ),
          SizedBox(
            height: 48.0,
          ),
          RoundedButton(
            title: 'Log In',
            color: Colors.lightBlueAccent,
            onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                    },
          ),
          RoundedButton(
            title: 'Register',
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
          ),

        ],
      ),
      ),

    );
  }
}
