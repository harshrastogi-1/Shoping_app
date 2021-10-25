import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _name = '';
  bool _chngeButton = false;
  final _loginKey = GlobalKey<FormState>();

  movetohome(BuildContext context) async{
    if (_loginKey.currentState!.validate()) {
      setState(() {
        _chngeButton=true;
      });
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushNamed(context, Myroutes.myHomePage);
    setState(() {
      _chngeButton=false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).canvasColor,
      child: Form(
        key: _loginKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome $_name",style: TextStyle(fontSize: 30),),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your user-name",
                  labelText: "User-Name",
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "UserName can't be empty";
                  }
                  return null;
                },
                onChanged: (value) {
                  _name = value;
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 30.0, right: 30),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter your password", labelText: "Password"),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password can't be empty";
                      }else if(value.length<6){
                        return "Password can't be less then 6 ";
                      }
                    },
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Material(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: InkWell(
                onTap: () => movetohome(context),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: _chngeButton?40:120,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: _chngeButton?Icon(Icons.done,color: Theme.of(context).accentColor,): Text(
                    'LOG-IN',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
