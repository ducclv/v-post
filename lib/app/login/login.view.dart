import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/app.module.dart';
import 'package:v_post/app/components/app-title/app-title.component.dart';
import 'package:v_post/app/components/appbar/appbar.component.dart';
import 'package:v_post/app/components/common-button/common-button.component.dart';
import 'package:v_post/app/components/text-field/text-field.component.dart';
import 'package:v_post/app/login/login.cubit.dart';
import 'package:v_post/config/application.dart';
import 'package:v_post/config/config_screen.dart';
import 'package:v_post/themes/style.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final LoginCubit _cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(title: AppTitle()),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.safeBlockHorizontal * 10),
              Text(
                "Đăng nhập",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: SizeConfig.safeBlockHorizontal),
              SizedBox(child: buildLoginWidget(), width: SizeConfig.safeBlockHorizontal * 85),
              SizedBox(height: SizeConfig.safeBlockVertical),
              SizedBox(child: buildOtherMethodWidget(), width: SizeConfig.safeBlockHorizontal * 80),
              SizedBox(height: SizeConfig.safeBlockHorizontal * 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginWidget() {
    return FormBuilder(
      key: _fbKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.safeBlockVertical * 2),
          Text("Số điện thoại", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
          TextFieldView(
            name: "user_name",
            hintText: "Bắt buộc",
            validator: FormBuilderValidators.required(context),
            type: 'text_field',
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          Text("Mật khẩu", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
          TextFieldView(
            name: 'password',
            hintText: "Bắt buộc",
            validator: FormBuilderValidators.required(context),
            type: 'password',
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          Center(
            child: GestureDetector(
              onTap: () => print("aa"),
              behavior: HitTestBehavior.translucent,
              child: Text(
                "Quên mật khẩu?",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColor.accentColor,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          ButtonTheme(
            minWidth: SizeConfig.safeBlockHorizontal * 55,
            height: 45.0,
            child: BlocBuilder<LoginCubit, LoginState>(
              bloc: _cubit,
              builder: (context, state) {
                return AbsorbPointer(
                  absorbing: state is Signing,
                  child: CommonButton(
                      onPressed: () async {
                        _fbKey.currentState!.saveAndValidate()
                            ? await _cubit.login(_fbKey.currentState!.value)
                                ? Modular.to.pushReplacementNamed(AppModule.switching)
                                : Application.toast.showToastNotification("Wrong User Name or Password")
                            : Application.toast.showToastNotification("Invalid Value");
                      },
                      backgroundColor: AppColor.accentColor,
                      child: Container(
                        alignment: Alignment.center,
                        width: SizeConfig.safeBlockHorizontal * 80,
                        child: state is! Signing
                            ? Text(
                                "Đăng nhập",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                              )
                            : Theme(
                                data: ThemeData(cupertinoOverrideTheme: CupertinoThemeData(brightness: Brightness.dark)),
                                child: CupertinoActivityIndicator(),
                              ),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOtherMethodWidget() => Column(
        children: [
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          Text(
            "Hoặc",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Color(0xFFFF0000).withOpacity(0.89),
                  fontWeight: FontWeight.w700,
                ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Image.asset("assets/images/login/facebook.png", height: 50),
                onTap: () => print("aaa"),
              ),
              GestureDetector(
                child: Image.asset("assets/images/login/gmail.png", height: 50),
                onTap: () => print("aaa"),
              ),
              GestureDetector(
                child: Image.asset("assets/images/login/zalo.png", height: 50),
                onTap: () => print("aaa"),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          Text(
            "Bạn chưa có tài khoản",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 2),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Modular.to.pushNamed(AppModule.signup),
            child: Text(
              "Đăng ký",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, color: Color(0xFFDB3E00)),
            ),
          ),
        ],
      );
}
