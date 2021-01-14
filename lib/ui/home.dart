import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work2/logic/controller/NoteController.dart';

import 'package:test_work2/widget/textInput.dart';

class Home extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                leading: SizedBox(),
                collapsedHeight: 70,
                expandedHeight: 230,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  titlePadding: EdgeInsets.all(10),
                  centerTitle: true,
                  title: hometextInput(),
                  background: Container(
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.note_add,
                          size: 45,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: controller.notes.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue),
                            child: ListTile(
                              isThreeLine: false,
                              title: Text(
                                controller.notes[index].text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.clip,
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    controller.removeNote(index);
                                  }),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
