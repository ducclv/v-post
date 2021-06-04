import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:v_post/app/components/app-title/app-title.component.dart';
import 'package:v_post/app/components/appbar/appbar.component.dart';
import 'package:v_post/app/components/text-field/text-field.component.dart';
import 'package:v_post/config/config_screen.dart';
import 'package:v_post/themes/style.dart';

class _NestedData {
  String hintText;
  Icon icon;
  String name;

  _NestedData({required this.name, required this.hintText, required this.icon});
}

class DeliveryDetail extends StatefulWidget {
  final bool hasRating;

  const DeliveryDetail({Key? key, this.hasRating = false}) : super(key: key);

  @override
  _DeliveryDetailState createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  List<MapEntry<String, List<_NestedData>>> _allForm = [
    MapEntry(
      "Người gửi",
      [
        _NestedData(name: "sender_name", hintText: "Họ và tên", icon: Icon(Icons.person_outlined)),
        _NestedData(name: "sender_phone", hintText: "Số điện thoại", icon: Icon(Icons.call_outlined)),
        _NestedData(name: "sender_address", hintText: "Địa chỉ", icon: Icon(Icons.place_outlined)),
      ],
    ),
    MapEntry(
      "Người nhận",
      [
        _NestedData(name: "receiver_name", hintText: "Họ và tên", icon: Icon(Icons.person_outlined)),
        _NestedData(name: "receiver_phone", hintText: "Số điện thoại", icon: Icon(Icons.call_outlined)),
        _NestedData(name: "receiver_address", hintText: "Địa chỉ", icon: Icon(Icons.place_outlined)),
      ],
    ),
    MapEntry(
      "Thông tin",
      [
        _NestedData(name: "code", hintText: "Mã đơn hàng", icon: Icon(Icons.qr_code_outlined)),
        _NestedData(name: "order_date", hintText: "Ngày đặt hàng", icon: Icon(Icons.calendar_today_outlined)),
        _NestedData(name: "picking_date", hintText: "Ngày lấy hàng", icon: Icon(Icons.calendar_today_outlined)),
        _NestedData(name: "receive_date", hintText: "Ngày nhận", icon: Icon(Icons.calendar_today_outlined)),
        _NestedData(name: "name", hintText: "Tên hàng hoá", icon: Icon(Icons.all_inbox_outlined)),
        _NestedData(name: "fee", hintText: "Giá vận chuyển", icon: Icon(Icons.attach_money_outlined)),
        _NestedData(name: "rider", hintText: "Tài xế giao", icon: Icon(Icons.person_outlined)),
        _NestedData(name: "phone", hintText: "Số điện thoại", icon: Icon(Icons.call_outlined)),
        _NestedData(name: "status", hintText: "Trạng thái", icon: Icon(Icons.loop_outlined)),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(
        title: AppTitle(),
        leading: BackButtonWidget(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          child: FormBuilder(
            key: _fbKey,
            enabled: false,
            initialValue: {
              "sender_name": "Đỗ Vân",
              "sender_phone": "0915919357",
              "sender_address": "144 Xuân Thủy",
              "receiver_name": "Đỗ Vân",
              "receiver_phone": "0915919357",
              "receiver_address": "144 Xuân Thủy",
              "picking_date": " 13/2/2021",
              "receive_date": " 14/2/2021",
              "order_date": " 116/03/2021 | 8:12 AM",
              "code": " 222222222",
              "name": " Giấy tờ",
              "rider": " Phong/ Chưa có tài xế",
              "phone": " 0915919357",
              "status": " Đã giao",
              "fee": " 75.000 VND",
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Text(
                  "Chi tiết đơn hàng",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700, fontSize: 30),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                ..._allForm.map((e) => buildGroupTextField(title: e.key, data: e.value)),
                SizedBox(height: SizeConfig.safeBlockVertical * 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGroupTextField({required String title, required List<_NestedData> data}) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.accentColor, fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            ...title != "Thông tin"
                ? data.map((e) => TextFieldView(
                      name: e.name,
                      type: 'text_field',
                      hintText: e.hintText,
                      prefixIcon: e.icon,
                    ))
                : data.map((e) => buildCustomInformationForm(e)),
          ],
        ),
      );

  Widget buildCustomInformationForm(_NestedData e) => Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical),
        child: FormBuilderTextField(
          name: e.name,
          maxLines: 1,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.accentColor, width: 1.25, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(13),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.accentColor, width: 1.25, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(13),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.errorColor, width: 1.25, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(13),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.errorColor, width: 1.25, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(13),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.accentColor, width: 1.25, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(13),
              ),
              prefixIcon: e.icon,
              prefixText: "${e.hintText}:",
              prefixStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w700,
                  )),
          keyboardType: TextInputType.text,
          validator: FormBuilderValidators.required(context),
        ),
      );
}
