import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:v_post/app/app.module.dart';
import 'package:v_post/app/components/app-title/app-title.component.dart';
import 'package:v_post/app/components/appbar/appbar.component.dart';
import 'package:v_post/app/home/shared/shared.module.dart';
import 'package:v_post/config/config_screen.dart';
import 'package:v_post/themes/style.dart';

class _NestedData {
  int price;
  int code;
  String senderAddress;
  String receiverAddress;
  String senderDate;
  double rating;
  String customerName;

  _NestedData({
    required this.rating,
    required this.senderDate,
    required this.code,
    required this.price,
    required this.receiverAddress,
    required this.senderAddress,
    required this.customerName,
  });
}

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  List<_NestedData> _data = [
    _NestedData(
        senderDate: "23/2/2021 | 8:09 PM",
        rating: 4.7,
        code: 132422211,
        price: 75000,
        receiverAddress: "144 Xuân Thủy, Cầu Giấy",
        senderAddress: "175 Láng Hạ",
        customerName: "Đỗ Vân"),
    _NestedData(
        senderDate: "23/2/2021 | 8:09 PM",
        rating: 4.7,
        code: 132422211,
        price: 75000,
        receiverAddress: "144 Xuân Thủy, Cầu Giấy",
        senderAddress: "175 Láng Hạ",
        customerName: "Đỗ Vân"),
    _NestedData(
        senderDate: "23/2/2021 | 8:09 PM",
        rating: 4.7,
        code: 132422211,
        price: 75000,
        receiverAddress: "144 Xuân Thủy, Cầu Giấy",
        senderAddress: "175 Láng Hạ",
        customerName: "Đỗ Vân"),
    _NestedData(
        senderDate: "23/2/2021 | 8:09 PM",
        code: 132422211,
        rating: 4.7,
        price: 75000,
        receiverAddress: "144 Xuân Thủy, Cầu Giấy",
        senderAddress: "175 Láng Hạ",
        customerName: "Đỗ Vân"),
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
                "Quản lý đơn hàng",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700, fontSize: 30),
              ),
              ..._data.map((e) => buildCardWidget(
                    data: e,
                    onPressed: () => Modular.to.pushNamed(AppModule.shared + SharedModule.detailDelivery),
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
              Column(
                children: [
                  SvgPicture.asset('assets/images/home/gift.svg'),
                  SizedBox(height: SizeConfig.safeBlockHorizontal * 2),
                  Text(NumberFormat.currency(locale: "vi_vn").format(data.price),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(height: SizeConfig.safeBlockHorizontal * 2),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mã đơn : ID${data.code}", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
                        Text("Chi tiết",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700, color: Color(0xFF2196F3)))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person_outlined, color: Color(0xFF2196F3), size: 14),
                              SizedBox(width: SizeConfig.safeBlockHorizontal),
                              Text("Họ tên khách hàng: ${data.customerName}",
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xFF404040)))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.my_location, color: Color(0xFF2196F3), size: 14),
                              SizedBox(width: SizeConfig.safeBlockHorizontal),
                              Text("Điểm đi: ${data.senderAddress}", style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xFF404040)))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.place_outlined, color: Color(0xFF2196F3), size: 14),
                              SizedBox(width: SizeConfig.safeBlockHorizontal),
                              Text("Điểm đến: ${data.receiverAddress}",
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xFF404040)))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.thumb_up_outlined, color: Color(0xFF2196F3), size: 14),
                              SizedBox(width: SizeConfig.safeBlockHorizontal),
                              Text("Đánh giá:", style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xFF404040))),
                              SizedBox(width: SizeConfig.safeBlockHorizontal),
                              RatingBar.builder(
                                initialRating: data.rating,
                                minRating: 0,
                                ignoreGestures: true,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 14,
                                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                                onRatingUpdate: (rating) {},
                              )
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
