import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/base/base_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/auth_provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
            body: 
           // Provider.of<User>(context, listen: false).logged == true ?  HomeView() :
            model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Center(
                  child: FlatButton(
                      child: Text("Login"),
                      onPressed: () async {
                        var loginSuccess = await model.login();
                        if (loginSuccess) {
                          print('LoginView loginSuccess setting up setLoggedIn ');
                          Provider.of<AuthProvider>(context, listen: false).setLoggedIn(model.user.username,model.user.token);
                        }
                      }),
                )));
  }
}
