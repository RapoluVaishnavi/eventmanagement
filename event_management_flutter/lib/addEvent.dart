
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/services/http_service.dart';

class AddEvent extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _AddEventState();

}
class _AddEventState extends State<AddEvent>{


  TextEditingController eventName = TextEditingController();
  String? eventType ;
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController seatCount = TextEditingController();

final List<String> eventTypeList = ["Good","traditional","Cultural","Retro"];


  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      appBar: AppBar(

      ),
      // backgroundColor: Colors.blue,
      resizeToAvoidBottomInset: true,
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.black], begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 40,horizontal: 20),
            child: Column(
              children: [
                TextField(
                  controller: eventName,
                  decoration: InputDecoration(
                    hint: Text('hi'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),

                // DropdownButton<String>(
                //     items: eventTypeList.map((String event){
                //     return DropdownMenuItem<String>(
                //         value: event,
                //       child: event,
                //     );
                //       )}.t,
                //         onChanged: (){
                //   print("hii")
                // }
                // ),

                SizedBox(height: 20,),


                DropdownButtonFormField<String>(
                  // icon: Icon(Icons.access_alarm, color: Colors.white,),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.dashboard,color: Colors.green,),
                    icon: Icon(Icons.access_alarm,color: Colors.white,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                  iconEnabledColor: Colors.white,
                  hint: Text('Select an option',style: TextStyle(color: Colors.teal)),
                  // style: TextStyle(color: Colors.green),
                  dropdownColor: Colors.blue,
                  value: eventType,
                  borderRadius: BorderRadius.circular(10),
                  onChanged: (String? newValue) {
                    setState(() {
                      eventType = newValue;
                    });
                  },
                  items: eventTypeList.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                  selectedItemBuilder: (BuildContext context) {
                    return eventTypeList.map((String option) {
                      return Text(' $option',style: TextStyle(color: Colors.yellow),);
                    }).toList();
                  },
                ),

                SizedBox(height: 30,),

                TextField(
                  controller: price,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                TextField(
                  controller: seatCount,
                  decoration: InputDecoration(
                    labelText: 'Seat Count',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                ElevatedButton(
                    onPressed: () async {
                      await onSubmit();
                    },
                    child: Text('submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: Size(180, 50),
                  ),
                )
              ],
            ),
          ),
        ),
      ) ,
    ),
    );
  }


  Future<void> onSubmit() async {

    var request = {
      // 'id': id,
      'eventName': eventName.text.trim(),
      'eventType': eventType,
      'description': description.text.trim(),
      'price': price.text.trim(),
      'seatsCount': seatCount.text.trim(),
      // 'eventDateTime': eventDateTime,
    };

    final response = await HttpService().addEvent(request);
    print('add event res ${response}');
  }



}