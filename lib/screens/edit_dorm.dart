import 'package:flutter/material.dart';
import 'package:moddormy_flutter/models/dorm.dart';
import 'package:moddormy_flutter/models/dorm_feature.dart';
import 'package:moddormy_flutter/models/image.dart';
import 'package:moddormy_flutter/models/room.dart';
import 'package:moddormy_flutter/models/room_frature.dart';
import 'package:moddormy_flutter/utilities/caller.dart';
import 'package:moddormy_flutter/widgets/my_appbar.dart';
import 'package:moddormy_flutter/widgets/my_drawer.dart';
import 'package:moddormy_flutter/widgets/post_dorm/dorm_form.dart';

class EditForm extends StatefulWidget {
  final int dormId;

  const EditForm({super.key, required this.dormId});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  Dorm? dorm;
  List<Imagestring> myimages = [];
  String? description;
  int? roomCount;
  Future<void> getDormDetail() async {
    try {
      final response = await Caller.dio
          .get('/api/manage-dorm/getDormDetail?dormId=${widget.dormId}');
      // debugPrint(response.data.toString());
      final response2 = await Caller.dio
          .get('/api/manage-room/getDormRoom?dormId=${widget.dormId}');
      List<Room> rooms =
          response2.data.map<Room>((e) => Room.fromJson(e)).toList();
      // Dorm dorm = Dorm.fromJson(response.data['data']);
      Dorm d = Dorm.fromJson(response.data);
      d.rooms = rooms;
      roomCount = d.rooms.length;
      setState(() {
        dorm = d;
        description = dorm!.description;
        debugPrint(dorm!.rooms.toString());
      });
    } catch (e) {
      debugPrint('$e error dormDetail');
    }
  }

  Future<void> getDormImages() async {
    try {
      final response = await Caller.dio
          .get('/api/manage-dorm/getDormImage?dormId=${widget.dormId}');
      // debugPrint(response.data.toString());

      List<Imagestring> r = response.data
          .map<Imagestring>((e) => Imagestring.fromJson(e))
          .toList();

      setState(() {
        myimages = r;
      });
      debugPrint(myimages.toString());
    } catch (e) {
      debugPrint('$e error image');
    }
  }
  

  @override
  void initState() {
    super.initState();
    getDormDetail();
    getDormImages();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (dorm == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [CircularProgressIndicator()],
      );
    }
    debugPrint("edit dorm");
    return Scaffold(
      backgroundColor: const Color(0xfffff9f0),
      appBar: const MyAppbar(),
      endDrawer: const MyDrawer(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          child: ListView(
            shrinkWrap: true,
            children: [
              DormForm(
                dorm: dorm!,
                post: false,
                myimages: myimages,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
