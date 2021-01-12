import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/SignUp.dart';
import '../Provider/SignUpNotifier.dart';
import 'choice.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mobileno = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return ChangeNotifierProvider<SignUpNotifier>(
      create: (context)=>SignUpNotifier(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.4,),
                  Text('LOGIN', style: TextStyle(fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize:29, color: Colors.cyan),),
                  SizedBox(height: size.height * 0.05,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                  color: Colors.grey[200]
                              ))
                          ),
                          child: Consumer<SignUpNotifier>(
                            builder: (context,SignUpNotifier,child) {
                              return TextField(
                                controller: mobileno,
                                onChanged: (val) {
                                  SignUpNotifier.changeNo(val);

                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mobile No",
                                    hintStyle: TextStyle(color: Colors.grey)
                                ),
                              );

                            }),
                        ),
                       /* Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),
                        )*/
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.05,),
                  Container(
                    height: 60,
                    width: 346,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]
                    ),

                    child: RaisedButton(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.cyan,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Choice()));
                      },
                      child: Text(
                        "LOGIN", style: TextStyle(color: Colors.white, fontSize:
                      20),),),
                  ),
                  SizedBox(height: size.height * 0.04,),
                 /* InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUp()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not a member?Sign in',
                          style: TextStyle(color: Colors.blue),),
                      ],
                    ),
                  )
*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

