import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_work2/logic/model/model.dart';

class NoteController extends GetxController {
  var notes = List<Notes>().obs;

  void addNote(String text) {
    notes.add(Notes(text: text));
    notes.refresh();
  }

  void removeNote(int index) {
    notes.removeAt(index);
    notes.refresh();
  }

  @override
  void onInit() {
    List _notes = GetStorage().read<List>('notes');

    if (_notes != null) {
      notes = _notes.map((e) => Notes.fromJson(e)).toList().obs;
      print(_notes.length);
    }

    ever(notes, (_) {
      GetStorage()
          .write('notes', notes.toJson())
          .then((value) => print('writed'))
          .catchError((e) => print(e));
    });

    super.onInit();
  }
}
