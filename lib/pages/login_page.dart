import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_veiculos/model/login_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  bool hidePassword = true;

  LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      key: scaffoldkey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModel.email = input,
                          validator: (input) => !input.contains("@")
                              ? "Cade o arroba animal"
                              : null,
                          decoration: new InputDecoration(
                              hintText: "Email Address",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).accentColor,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.password = input,
                          validator: (input) => input.length < 3
                              ? "mais de 3 digitodasdads tem q por"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                              hintText: "Password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).accentColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: Size(195, 40),
                            backgroundColor: Theme.of(context).accentColor,
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            if (validateAndSave()) {
                              print(requestModel.toJson());
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
