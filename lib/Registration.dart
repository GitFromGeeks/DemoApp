import 'package:flutter/material.dart';
import 'Home.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool isLoading = false;
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.blueAccent,
        // backgroundColor: Color(0xfff2f3f7),
        body: Container(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          // color: Color(0xff2470c7),
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(70),
                            bottomRight: const Radius.circular(70),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildLogo(),
                            _buildContainer(),
                            Padding(padding: EdgeInsets.only(top: 20.0)),
                            Text(
                              'Already Account?',
                              style: TextStyle(color: Colors.white),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text("SIGNIN"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            "Logo",
            style: TextStyle(
              fontSize: 150,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SingUp",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 50,
                      ),
                    ),
                  ],
                ),
                _userName(),
                _password(),
                _email(),
                _phone(),
                _signupButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _userName() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: usernameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Color(0xff2470c7),
            ),
            labelText: "User Name"),
      ),
    );
  }

  Widget _email() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff2470c7),
            ),
            labelText: "Email"),
      ),
    );
  }

  Widget _phone() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.number,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone,
              color: Color(0xff2470c7),
            ),
            labelText: "Phone"),
      ),
    );
  }

  Widget _password() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff2470c7),
            ),
            labelText: "Password"),
      ),
    );
  }

  Widget _signupButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * ((MediaQuery.of(context).size.height) / 25),
          width: 5 * ((MediaQuery.of(context).size.width) / 15),
          margin: EdgeInsets.only(top: 10, bottom: 20),
          child: ElevatedButton(
            child: Text(
              "SIGNUP",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 50,
              ),
            ),
            onPressed: () {
              Signup(usernameController.text, passwordController.text);
            },
          ),
        )
      ],
    );
  }

  Signup(username, password) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Home(username: username, password: password)));
  }
}
