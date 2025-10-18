

import 'dart:convert';

class EventsModel {

  String? eventName;
  String? eventType;
  String? description;
  double? price;
  int? seatsCount;
  String? eventDateTime;

  EventsModel(
      this.eventType,
      this.eventDateTime,
      this.price,
      this.eventName,
      this.seatsCount,
      this.description
      );

  EventsModel.fromJson(Map<String, dynamic> json)
  {
    eventName = json['eventName'];
    eventType = json['eventType'];
    price = json['price'];
    description = json['description'];
    seatsCount = json['seatsCount'];
  }


  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data ={};

    data['eventType'] = eventType;
    data['eventName'] = eventName;
    data['eventDateTime'] = eventDateTime;
    data['price'] = price;
    data['description'] = description;
    data['seatsCount'] = seatsCount;

  return data;
  }


  static List<EventsModel> convertEvents(dynamic eventData){

    List<EventsModel> event = [];

    if(eventData is List){
      event = eventData.map((data) => EventsModel.fromJson(data)).toList();
    }
    else if (eventData is Map<String, dynamic>){
      event.add(EventsModel.fromJson(eventData));
    }
    return event;
  }

}