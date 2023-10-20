import 'package:flutter/material.dart';
import 'package:penta/penta.dart';
import 'package:penta_highlights/src/main/explore/explore_page.dart';

class SelectAccountPage extends StatefulWidget {
  const SelectAccountPage({super.key});

  @override
  State<SelectAccountPage> createState() => _SelectAccountPageState();
}

class _SelectAccountPageState extends State<SelectAccountPage>
    with SingleTickerProviderStateMixin {
  bool animTest = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1)).then((value) {
      setState(() {});
      animTest = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ..._animations(),
          Positioned(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ..._titleWelcome(),
                    const SizedBox(
                      height: 48,
                    ),
                    PentaPrimaryButton(
                      label: 'Log In',
                      onPressed: () {
                        Navigator.pushReplacement(context,MaterialPageRoute<void>(
                          builder: (BuildContext context) => const ExplorePage(),
                        ) );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    PentaPrimaryButton(
                      label: 'Sign Up',
                      onPressed: () {},
                      reverse: true,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
  List<Widget> _animations(){
    final Size size = MediaQuery.of(context).size;

    return [
      AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: size.height * (animTest ? 0.1 : 0.1),
            left: -size.width * (animTest ? 0.4 : 1.0),
            child: Image.asset(
              'assets/img/penta_logo.png',
              width: 300,
              height: 471,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: size.height * (animTest ? 0.0 : 0.0),
            right: -size.width * (animTest ? 0.4 : 2),
            child: Image.asset(
              'assets/img/sigma-full.png',
              width: 400,
              height: 879,
            ),
          )
    ];
  }
  List<Widget> _titleWelcome() {
    return [
      const PentaTitle(
        label: 'Welcome',
      ),
      Row(
        children: const [
          PentaTitle(
            label: 'to ',
          ),
          PentaTitle(
            label: 'Penta',
            colorText: colorPrimary,
          ),
        ],
      ),
    ];
  }
}
