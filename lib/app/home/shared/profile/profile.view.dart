import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:v_post/app/app.module.dart';
import 'package:v_post/app/components/app-title/app-title.component.dart';
import 'package:v_post/app/components/appbar/appbar.component.dart';
import 'package:v_post/app/components/common-button/common-button.component.dart';
import 'package:v_post/config/config_screen.dart';
import 'package:v_post/themes/style.dart';

class _NestedData {
  String hintText;
  Icon icon;
  Icon? suffixIcon;
  String? data;

  _NestedData({
    required this.hintText,
    required this.icon,
    this.data,
    this.suffixIcon,
  });
}

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  List<_NestedData> _sampleData = [
    _NestedData(
      hintText: "Họ và tên",
      data: "Đỗ Vân",
      icon: Icon(Icons.person_outlined),
      suffixIcon: Icon(Icons.edit_outlined, color: AppColor.accentColor),
    ),
    _NestedData(
      hintText: "Số điện thoại",
      data: "0915919357",
      icon: Icon(Icons.call_outlined),
      suffixIcon: Icon(Icons.edit_outlined, color: AppColor.accentColor),
    ),
    _NestedData(
      hintText: "Địa chỉ",
      data: "144 Xuân Thủy, Cầu Giấy",
      icon: Icon(Icons.place_outlined),
      suffixIcon: Icon(Icons.edit_outlined, color: AppColor.accentColor),
    ),
    _NestedData(
      hintText: "Số điện thoại tổng đài",
      data: "0977222888",
      icon: Icon(Icons.support_agent_outlined),
    ),
    _NestedData(
        hintText: "Chính sách quy định",
        icon: Icon(Icons.place_outlined),
        suffixIcon: Icon(Icons.arrow_forward_ios_outlined, color: AppColor.accentColor)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(title: AppTitle()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              Text(
                "Cá nhân",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700, fontSize: 30),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 4),
              Text(
                "Thông tin cá nhân",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700),
              ),
              ..._sampleData.map((e) => buildCustomInformationForm(e)),
              SizedBox(height: SizeConfig.safeBlockVertical * 4),
              Align(
                alignment: Alignment.center,
                child: CommonButton(
                  onPressed: () => Modular.to.pushReplacementNamed(AppModule.login),
                  child: Text(
                    "Đăng xuất",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  backgroundColor: AppColor.accentColor,
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomInformationForm(_NestedData e) => Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical),
        child: ListTile(
          onTap: () {},
          title: Row(
            children: [
              Text(e.hintText, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
              if (e.data != null) Text(" : ", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
              if (e.data != null)
                Expanded(
                  child: Text(
                    e.data!,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
            ],
          ),
          minLeadingWidth: 0,
          leading: e.icon,
          trailing: e.suffixIcon,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.accentColor, width: 1.25, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      );
}
