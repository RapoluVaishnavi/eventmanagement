

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/models/events_model.dart';
import '../config/ip_config.dart';
import '../models/user_model.dart';

class HttpService {
  var client = http.Client();

  Future<UserModel?> signup(UserModel user) async {
    final response = await client.post(
      Uri.parse("${IpConfig.apiAddress}/eventmanagment/user/createUser"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()), // DTO passed here
    );

    if (response.statusCode == 200) {
      print('Registration success. ${response.body}');
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Signup failed: ${response.body}");
    }
  }

  // Login
  Future<http.Response> userLogin(
      String? email,String? password) async {

    var response = await client.get(Uri.parse(
        "${IpConfig.apiAddress}/eventmanagment/user/login?emailId=$email&password=$password"),
    );
  if (response.statusCode == 200) {
        print('response**${response.body}');
      return response;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<http.Response> addEvent(request) async {

    final response = await http.post(Uri.parse('${IpConfig.apiAddress}/eventmanagement/events/addEvent'),
        headers: {"Content-Type" : "application/json"},
        body:jsonEncode(request),
    );
    print('respknse add event --- ${response.body}');

    if (response.statusCode == 200) {
      print('Registration success.');
      return response;
    } else {
      throw Exception("Add Event failed: ${response.body}");
    }

  }


  Future<List<EventsModel>?> fetchEvents() async {

    final response = await client.get(Uri.parse('${IpConfig.apiAddress}/eventmanagement/events/getAllEvents')
    );

    List<EventsModel>? events = null;
    if(response.statusCode == 200){
      events = EventsModel.convertEvents(
          jsonDecode(response.body));
      return events;
    }
    else{
      return events;
    }

  }

}