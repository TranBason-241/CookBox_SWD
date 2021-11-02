import 'package:app/getx/controller/map_controller.dart';
import 'package:app/getx/controller/store_controller.dart';
import 'package:app/models/place_item_res.dart';
import 'package:app/screens/ggmap/place_bloc.dart';
import 'package:app/screens/picker_store_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class RidePickerPage extends StatefulWidget {
  // final String? selectedAddress;
  // final Function(PlaceItemRes, bool) onSelected;
  // final bool _isFromAddress;

  // RidePickerPage(this.selectedAddress, this.onSelected, this._isFromAddress);

  @override
  _RidePickerPageState createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  var _addressController;
  var placeBloc = PlaceBloc();

  @override
  void initState() {
    // _addressController = TextEditingController(text: widget.selectedAddress);
    _addressController = TextEditingController();
    _addressController =
        TextEditingController(text: "Tìm kiếm địa chỉ của bạn");

    super.initState();
  }

  @override
  void dispose() {
    // placeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        titleSpacing: 0,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Địa chỉ của bạn'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xfff8f8f8),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 60,
                        child: Center(
                          child: Image.asset("ic_location_black.png"),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 40,
                        height: 60,
                        child: Center(
                          child: FlatButton(
                              onPressed: () {
                                _addressController.text = "";
                              },
                              child: Image.asset("ic_remove_x.png")),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: TextField(
                          controller: _addressController,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str) {
                            placeBloc.searchPlace(str);
                          },
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff323643)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: StreamBuilder(
                stream: placeBloc.placeStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data.toString());
                    if (snapshot.data == "start") {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    print(snapshot.data.toString());

                    List<PlaceItemRes> places =
                        snapshot.data as List<PlaceItemRes>;
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          // title: Text(places.elementAt(index).name == null ? '' : Text(places.elementAt(index).name),
                          // subtitle: Text(places.elementAt(index).address == null ? '' : Text(places.elementAt(index).address),
                          // onTap: () {
                          //   print("on tap");
                          //   Navigator.of(context).pop();
                          //   widget.onSelected(places.elementAt(index),
                          //       widget._isFromAddress);
                          // },
                          title: Text(places.elementAt(index).name),
                          subtitle: Text(places.elementAt(index).address),
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(
                                'address', places.elementAt(index).address);

                            prefs.setDouble('lat', places.elementAt(index).lat);
                            prefs.setDouble(
                                'long', places.elementAt(index).lng);

                            MapController controller = new MapController();

                            controller.calculateDistanceForAllGroup();
                          },
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        height: 1,
                        color: Color(0xfff5f5f5),
                      ),
                      itemCount: places.length,
                      // itemCount: places.length,
                    );
                  } else {
                    // return Container(
                    //   child: ElevatedButton(
                    //     // onPressed: () {
                    //     //   // MapController controller = new MapController();
                    //     //   // Get.to(MapController(), binding: MapBinding());
                    //     //   // controller.calculateDistanceForAllGroup();
                    //     // },
                    //     child: const Text('Xác nhận vị trí'),
                    //     onPressed: () async {
                    //       // Navigator.of(context).pop();
                    //       // widget.onSelected(places.elementAt(index),
                    //       //     widget._isFromAddress);
                    //       SharedPreferences prefs =
                    //           await SharedPreferences.getInstance();
                    //       // prefs.setString(
                    //       //     'address', places.elementAt(index).address);

                    //       prefs.setString('address',
                    //           '30 Đường Trần Não P. Bình An Quận 2 Thành phố Hồ Chí Minh');

                    //       // prefs.setDouble('lat', places.elementAt(index).lat);
                    //       // prefs.setDouble(
                    //       //     'long', places.elementAt(index).lng);
                    //       prefs.setDouble('lat', 10.790855357395138);
                    //       prefs.setDouble('long', 106.73012961248729);

                    //       MapController controller = new MapController();
                    //       // Get.to(MapController(), binding: MapBinding());
                    //       controller.calculateDistanceForAllGroup();

                    //       // controller.calculateDistance();
                    //     },
                    //   ),
                    // );
                    return Text('');
                  }
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  // MapController controller = new MapController();
                  // // Get.to(MapController(), binding: MapBinding());

                  // SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  // prefs.setString('address',
                  //     '30 Đường Trần Não P. Bình An Quận 2 Thành phố Hồ Chí Minh');
                  // prefs.setDouble('lat', 10.790855357395138);
                  // prefs.setDouble('long', 106.73012961248729);
                  // controller.calculateDistanceForAllGroup();
                  // // StoreController storeController = new StoreController();
                  // // storeController.fetchStore();
                  // // Get.toNamed('home');
                  // print('object');
                  Get.to(PickerStoreSreen(), binding: StoreBinding());
                },
                child: const Text('Xác nhận vị trí'),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  MapController controller = new MapController();
                  // Get.to(MapController(), binding: MapBinding());

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('address',
                      '30 Đường Trần Não P. Bình An Quận 2 Thành phố Hồ Chí Minh');
                  prefs.setDouble('lat', 10.790855357395138);
                  prefs.setDouble('long', 106.73012961248729);
                  controller.calculateDistanceForAllGroup();
                  // StoreController storeController = new StoreController();
                  // storeController.fetchStore();
                  // Get.toNamed('home');
                  print('object');
                  Get.to(PickerStoreSreen(), binding: StoreBinding());
                },
                child: const Text('Xác nhận vị trí'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
