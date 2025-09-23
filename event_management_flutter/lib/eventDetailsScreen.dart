// upcoming_events_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/models/events_model.dart';
import 'package:task_app/services/http_service.dart';

import 'main.dart';

class EventDetailScreen extends StatefulWidget {
  final EventsModel event;

  const EventDetailScreen({super.key, required this.event});

  @override
  State<StatefulWidget> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetailScreen>{

  List<EventsModel>? eventsDTOList = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
  }

  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Details", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.deepPurple, Colors.orange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white,),
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),color: Colors.white,),
      ),
      body:Container(
        decoration:BoxDecoration(
          gradient: LinearGradient(colors: [Colors.deepPurple, Colors.orange],
              begin: Alignment.topLeft, end:Alignment.bottomRight),
        ),
        child: loading ? Center(child: CircularProgressIndicator(),)
            : widget.event != null ?
        Container(
          child: Column(),
        ) :
        Center(
            child: Card(
              elevation: 6,
              color: Colors.white70,
              shadowColor: Colors.black,
              // decoration: BoxDecoration(
              //   color: Colors.green,
              //   borderRadius: BorderRadius.circular(6),
              // ),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(6),
              //   boxShadow:[
              //     BoxShadow(
              //     color: Colors.black,
              //     blurRadius: 6,
              //     offset: Offset(4, 4),
              //   )]
              // ),
              child: Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 30),
                child: Text('No Events ',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),),
            )),
      ),



      // ListView(
      //   children: [
      //     ListTile(title: Text("Music Concert"), subtitle: Text("29 Aug 2025")),
      //     ListTile(title: Text("Art Exhibition"), subtitle: Text("2 Sep 2025")),
      //   ],
      // ),
    );
  }
}