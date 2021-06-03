import 'package:flutter/material.dart';
import 'package:v_post/app/components/app-title/app-title.component.dart';
import 'package:v_post/app/components/appbar/appbar.component.dart';
import 'package:v_post/config/config_screen.dart';
import 'package:v_post/themes/style.dart';

class _NestedData {
  String customerName;
  String customerPhone;
  String mail;
  double rating;
  String imageUrl;

  _NestedData({
    required this.customerName,
    required this.customerPhone,
    required this.mail,
    required this.rating,
    required this.imageUrl,
  });
}

class ShipperListWidget extends StatefulWidget {
  const ShipperListWidget({Key? key}) : super(key: key);

  @override
  _ShipperListWidgetState createState() => _ShipperListWidgetState();
}

class _ShipperListWidgetState extends State<ShipperListWidget> {
  List<_NestedData> _data = [
    _NestedData(customerName: "Đỗ Vân", customerPhone: "0915919357", mail: "phong@gmail.com", rating: 4.7, imageUrl: ""),
    _NestedData(customerName: "Đỗ Vân", customerPhone: "0915919357", mail: "phong@gmail.com", rating: 4.7, imageUrl: ""),
    _NestedData(customerName: "Đỗ Vân", customerPhone: "0915919357", mail: "phong@gmail.com", rating: 4.7, imageUrl: ""),
    _NestedData(customerName: "Đỗ Vân", customerPhone: "0915919357", mail: "phong@gmail.com", rating: 4.7, imageUrl: ""),
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
                "Danh sách tài xế",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700, fontSize: 30),
              ),
              ..._data.map((e) => buildCardWidget(
                    data: e,
                    onPressed: () => null,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardWidget({required _NestedData data, required VoidCallback onPressed}) => Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(6),
            side: BorderSide(color: AppColor.accentColor),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: onPressed,
          child: Row(
            children: [
              Icon(Icons.person_outlined, color: AppColor.accentColor, size: 60),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person_outlined, color: Color(0xFF2196F3), size: 14),
                              SizedBox(width: SizeConfig.safeBlockHorizontal),
                              Text.rich(TextSpan(
                                text: "",
                                children: [
                                  TextSpan(
                                    text: "Họ tên khách hàng",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(text: ": ", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                                  TextSpan(
                                    text: data.customerName,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xFF404040)),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_outlined, color: Color(0xFF2196F3), size: 14),
                              SizedBox(width: SizeConfig.safeBlockHorizontal),
                              Text.rich(TextSpan(
                                text: "",
                                children: [
                                  TextSpan(
                                    text: "Số điện thoại",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(text: ": ", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                                  TextSpan(
                                    text: data.customerPhone,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xFF404040)),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.email_outlined, color: Color(0xFF2196F3), size: 14),
                              SizedBox(width: SizeConfig.safeBlockHorizontal),
                              Text.rich(TextSpan(
                                text: "",
                                children: [
                                  TextSpan(
                                    text: "Email",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(text: ": ", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                                  TextSpan(
                                    text: data.mail,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xFF404040)),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.thumb_up_outlined, color: Color(0xFF2196F3), size: 14),
                              SizedBox(width: SizeConfig.safeBlockHorizontal),
                              Text.rich(TextSpan(
                                text: "",
                                children: [
                                  TextSpan(
                                    text: "Đánh giá",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(text: ": ", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600)),
                                  TextSpan(
                                    text: data.rating.toString(),
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xFF404040)),
                                  ),
                                  WidgetSpan(child: Icon(Icons.star_outlined, color: Colors.yellowAccent), alignment: PlaceholderAlignment.middle)
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
