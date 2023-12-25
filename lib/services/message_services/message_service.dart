import 'dart:convert';

import 'package:chatapp2/model/msg_model.dart';
import 'package:dio/dio.dart';

class MessageService{
  List<MsgModel> messagesList =[];
Future getMessages({required String clientId ,required String myId})async{

  Dio dio =Dio();

var headers = {
  'Content-Type': 'application/json'
};

var data = json.encode({
  "from": myId,
  "to": clientId
});
 return   dio.post("http://192.168.18.72:5000/api/messages/getmsg",
data: data,
options: Options(
  contentType: 'application/json'
),
 ).then((value) {
  print(value.data.toString()+ 'aaaaaaaaaaaaa');
var list =value.data as  List;


for (var element in list) {
MsgModel messageModel =MsgModel.fromJson(element);

  messagesList.add(messageModel);
}
print(messagesList.toString()+ 'aaaaaaaaaaaaa');

return messagesList;
}).catchError((e){
  print(e);
});


// var headers = {
//   'Content-Type': 'application/json'
// };
// var data = json.encode({
//   "from": "658842425586e8adc1d63347",
//   "to": "658851905586e8adc1d63352"
// });
// var dio = Dio();
// var response = await dio.request(
//   'http://192.168.18.72:5000/api/messages/getmsg',
//   options: Options(
//     method: 'POST',
//     headers: headers,
//   ),
//   data: data,
// );

// if (response.statusCode == 200) {
//   print(json.encode(response.data));
// }
// else {
//   print(response.statusMessage);
// }

}

//send messagess
Future<void> sendMessage({required String clientId ,required String myId,required String? message})async{
  var headers = {
  'Content-Type': 'application/json'
};
var data = json.encode({
  "to": clientId,
  "from":myId,
  "message":message
});
var dio = Dio();
var response = await dio.request(
  'http://192.168.18.72:5000/api/messages/addmsg',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
  data: data,
);

if (response.statusCode == 200) {
  print(json.encode(response.data).toString() +'aaaaaaaaaaaaaaaaaaa');
}
else {
  print(response.statusMessage.toString() +'aaaaaaaaaaaa');
}
}

}