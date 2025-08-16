import 'package:hive_flutter/adapters.dart';
import 'package:news/data/model/sources.dart';

class SourceAdapter extends TypeAdapter<Source>{
  @override
  Source read(BinaryReader reader) {
    //* implement read
    var json= reader.readMap();
    return Source.fromJson(json.cast<String, dynamic>());
  }

  @override
  //* implement typeId
  int get typeId =>1; //* this is id

  @override
  void write(BinaryWriter writer, Source obj) {  //* this write as json
    //* implement write
    writer.writeMap(obj.toJson());//* this to convert the source to map 
  }


}