import 'package:flutter/material.dart';
import 'package:store_app/components/custom_surffix_icon.dart';
import 'package:store_app/components/default_button.dart';
import 'package:store_app/components/errors_form.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email;
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(25)),
        child: Column(
          children: [
            buildEmailTextField(),
            SizedBox(height: getProportionateScreenHeight(10)),
            ErrorsForm(errors: errors),
            SizedBox(height: getProportionateScreenHeight(10)),
            DefaultButton(
              text: "Send code",
              press: () {
                if (_formKey.currentState.validate()) {
                  //do  sth
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void addError({String error}) {
    setState(() {
      if (!errors.contains(error)) {
        errors.add(error);
      }
    });
  }

  void removeError({String error}) {
    setState(() {
      if (errors.contains(error)) {
        errors.remove(error);
      }
    });
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      onSaved: (newValue) {
        setState(() {
          email = newValue;
        });
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        labelStyle: TextStyle(
          fontSize: getProportionateScreenHeight(25),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          surffixIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
