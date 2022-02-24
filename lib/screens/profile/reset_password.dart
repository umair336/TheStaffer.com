import 'package:flutter/material.dart';

class Resetpassword extends StatefulWidget {
  @override
  _ResetpasswordState createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  bool _showPassword = true;
  bool _changePassword = true;
  bool _confirmPassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _changePasswordVisibility() {
    setState(() {
      _changePassword = !_changePassword;
    });
  }

  void _conmfirmPasswordVisibility() {
    setState(() {
      _confirmPassword = !_confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.1,
                      0.5,
                    ],
                    colors: [
                      Color.fromRGBO(0, 91, 196, 1),
                      Color.fromRGBO(97, 29, 165, 1),
                    ],
                  )),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(6, 17, 7, 0),
                      child: Row(children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            //  Navigator.push(
                            //    context,
                            // MaterialPageRoute(
                            //    builder: (context) => MainScreen()));
                          },
                        ),
                      ])),
                  Padding(
                    padding: EdgeInsets.only(top: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            //    token.toString()
                            'Reset Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: Column(children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.all(14),
                        child: TextFormField(
                          obscureText: _showPassword,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(83, 83, 83, 1)
                              // fontWeight: FontWeight.bold
                              ),
                          cursorColor: Colors.grey.shade500,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: _togglePasswordVisibility,
                              child: _showPassword
                                  ? Icon(Icons.visibility,
                                      color: Color.fromRGBO(183, 14, 105, 1))
                                  : Icon(Icons.visibility_off,
                                      color: Color.fromRGBO(183, 14, 105, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0)),
                            contentPadding:
                                EdgeInsets.only(left: 10.0, right: 10.0),
                            labelText: "Current Password",
                            hintStyle: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                                fontWeight: FontWeight.w500),
                            labelStyle: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                                fontWeight: FontWeight.w500),
                          ),
                          autocorrect: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(14),
                        child: TextFormField(
                          obscureText: _changePassword,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(83, 83, 83, 1)
                              // fontWeight: FontWeight.bold
                              ),
                          cursorColor: Colors.grey.shade500,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: _changePasswordVisibility,
                              child: _changePassword
                                  ? Icon(Icons.visibility,
                                      color: Color.fromRGBO(183, 14, 105, 1))
                                  : Icon(Icons.visibility_off,
                                      color: Color.fromRGBO(183, 14, 105, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0)),
                            contentPadding:
                                EdgeInsets.only(left: 10.0, right: 10.0),
                            labelText: "New Password",
                            hintStyle: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                                fontWeight: FontWeight.w500),
                            labelStyle: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                                fontWeight: FontWeight.w500),
                          ),
                          autocorrect: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(14),
                        child: TextFormField(
                          obscureText: _confirmPassword,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(83, 83, 83, 1)
                              // fontWeight: FontWeight.bold
                              ),
                          cursorColor: Colors.grey.shade500,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: _conmfirmPasswordVisibility,
                              child: _confirmPassword
                                  ? Icon(Icons.visibility,
                                      color: Color.fromRGBO(183, 14, 105, 1))
                                  : Icon(Icons.visibility_off,
                                      color: Color.fromRGBO(183, 14, 105, 1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0)),
                            contentPadding:
                                EdgeInsets.only(left: 10.0, right: 10.0),
                            labelText: "Confirm Password",
                            hintStyle: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                                fontWeight: FontWeight.w500),
                            labelStyle: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                                fontWeight: FontWeight.w500),
                          ),
                          autocorrect: false,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                        //   color: Color.fromRGBO(23, 197, 204, 1),
                        width: 270,
                        child: TextButton(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),

                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(13, 91, 196, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),

                                //   side: BorderSide(color: Colors.red.shade900),
                              ),
                            ),
                          ),
                          //      color: Colors.black,
                          //  textColor: Colors.white,
                          //     shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            //          Navigator.push(context,
                            //            MaterialPageRoute(builder: (context) => Profile()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ]))),
          ],
        ),
      ),
    );
  }
}
