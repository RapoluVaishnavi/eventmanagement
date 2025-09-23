// upcoming_events_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/models/events_model.dart';
import 'package:task_app/services/http_service.dart';

import 'eventDetailsScreen.dart';
import 'main.dart';

class UpcomingEventsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEventsScreen>{

   List<EventsModel>? eventsDTOList = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
    fetchEvents();
  }

  bool loading = false;


  Future<void> fetchEvents() async {
    List<EventsModel>? eventsList = await HttpService().fetchEvents();

    // print(eventsList[0].toJson());
    if (eventsList != null && eventsList.isNotEmpty) {
      // Do something with eventsList
      setState(() {
        eventsDTOList = eventsList;
        loading = false;
      });
      print('Fetched ${eventsList.length} events');
    } else {
      setState(() {
        eventsDTOList = null;
        loading = false;
      });
      print('No events found or failed to fetch');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming Events", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
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
            : eventsDTOList != null && eventsDTOList!.length > 0 ?
        ListView.builder(
          padding: EdgeInsets.all(14),
          itemCount: eventsDTOList?.length,
          itemBuilder:(context,index){
            final value = eventsDTOList?[index];
            return InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EventDetailScreen(event: eventsDTOList![index],)));
              },
              child: Card(
                // color: Colors.black,
              //   // elevation: 4,
              //   margin: EdgeInsets.only(bottom: 14),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(14),
              //   ),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: LinearGradient(
                        colors: [
                          Colors.red.withOpacity(0.1),
                          Colors.white,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                    // color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Image.asset('assets/images/default_driver_image.png',width: 50,height: 50,),
                        SizedBox(width: 50,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${value?.eventName}',style: TextStyle(color: Colors.black,fontSize: 20),),
                            Text('${value?.eventType}',style: TextStyle(color: Colors.black,fontSize: 20),)
                          ],
                        ),
                      ],
                    )
                ),
              ),

            );
          },

        ) :
        Center(
            child: Card(
              elevation: 6,
              color: Colors.white70,
              shadowColor: Colors.black,
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