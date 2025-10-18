import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      "title": "Upcoming Events",
      "subtitle": "Check what's next",
      "icon": Icons.event,
      "route": "/upcoming",
      "color": Colors.deepPurple
    },
    {
      "title": "My Bookings",
      "subtitle": "View registered events",
      "icon": Icons.bookmark,
      "route": "/bookings",
      "color": Colors.red.shade500
    },
    {
      "title": "Add Event",
      "subtitle": "Host a new event",
      "icon": Icons.add_box,
      "route": "/addEvent",
      "color": Colors.green
    },
    // {
    //   "title": "Gallery",
    //   "subtitle": "View event photos",
    //   "icon": Icons.photo_album,
    //   "route": "/gallery",
    //   "color": Colors.blue
    // },
    // {
    //   "title": "Shopping",
    //   "subtitle": "Buy resources",
    //   "icon": Icons.shopping_cart,
    //   "route": "/shopping",
    //   "color": Colors.teal
    // },
    {
      "title": "Profile",
      "subtitle": "View & edit details",
      "icon": Icons.person,
      "route": "/profile",
      "color": Colors.pink
    },
    {
      "title": "Settings",
      "subtitle": "Customize app",
      "icon": Icons.settings,
      "route": "/settings",
      "color": Colors.indigo
    },
    // {
    //   "title": "Feedback",
    //   "subtitle": "Share your thoughts",
    //   "icon": Icons.feedback,
    //   "route": "/feedback",
    //   "color": Colors.red
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EventHub Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.orangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        // color: Colors.white,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(14),
          itemCount: features.length,
          itemBuilder: (context, index) {
            final feature = features[index];
            return InkWell(
              onTap: () => Navigator.pushNamed(context, feature['route']),
              borderRadius: BorderRadius.circular(14),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.only(bottom: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(
                      colors: [
                        (feature['color'] as Color).withOpacity(0.1),
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor:
                        (feature['color'] as Color).withOpacity(0.2),
                        child: Icon(
                          feature['icon'],
                          size: 30,
                          color: feature['color'],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${feature['title']}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              feature['subtitle'],
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.grey[600]),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}