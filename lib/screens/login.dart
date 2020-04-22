import 'package:firebaselogin/helper/login_background.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    /*
      MediaQuery.of(context).size             //앱 화면 크기 size  Ex> Size(360.0, 692.0)
      MediaQuery.of(context).size.height      //앱 화면 높이 double Ex> 692.0
      MediaQuery.of(context).size.width       //앱 화면 넓이 double Ex> 360.0
      MediaQuery.of(context).devicePixelRatio //화면 배율    double Ex> 4.0
      MediaQuery.of(context).padding.top      //상단 상태 표시줄 높이 double Ex> 24.0
    */

    return Scaffold(
      appBar: AppBar(title: Text("Firebase Login")),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
        CustomPaint(
          size: size,
          painter: LoginBackground(),
        ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
//              Image.network("https://picsum.photos/200"),
              _logoImage,
//    FadeInImage.assetNetwork(placeholder: "assets/tenor.gif" ,image:"https://picsum.photos/200")),
//              Image.asset("assets/tenor.gif"),
              Stack(
                children: <Widget>[
                  _inputForm(size),
//                Container(width: 100, height: 50, color: Colors.black),
                  _authButton(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Text("Don't have an Account? Create One"),
              Container(
                height: size.height * 0.05,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
          ),
        ),
      );

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05), //const : 변할 수 없는 상수
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
//                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "Email"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please input correct Email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,    //비밀번호 ***** 표시
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please input correct Password";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Text("Forgot Password"),
                ],
              )),
        ),
      ),
    );
  }

  Widget _authButton(Size size) => Positioned(
      left: size.width * 0.2,
      right: size.width * 0.2,
      bottom: 0,
      child: SizedBox(
          height: 50,
          child: RaisedButton(
              child: Text('Login', style: TextStyle(fontSize: 20, color: Colors.white),),
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                if(_formkey.currentState.validate()){
                  print(_emailController.value.toString());
                }
              })));
}
