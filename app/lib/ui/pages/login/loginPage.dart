import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sized = size.width - (size.width * .4);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Logo(),
              Container(
                color: Colors.black,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    InputFieldWidget(
                      sized: sized,
                      placeholder: 'Digite seu Usuario',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFieldWidget(
                      sized: sized,
                      placeholder: 'Digite sua senha',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () => {},
                      child: Text('Log In'),
                      color: Color(4280175771),
                      textColor: Colors.white,
                      minWidth: sized,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    Key? key,
    required this.sized,
    required this.placeholder,
  }) : super(key: key);

  final double sized;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Colors.white12,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: 100,
        child: TextFormField(
          initialValue: '',
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      width: sized,
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Center(
        child: Text('Instagram',
            style: TextStyle(
              fontSize: 41,
              color: Colors.white,
            )),
      ),
    );
  }
}
