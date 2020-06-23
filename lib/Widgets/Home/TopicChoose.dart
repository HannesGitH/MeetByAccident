import 'package:flutter/material.dart';
import 'package:meetby_accident/Widgets/Home/GiantButton.dart';
import 'package:meetby_accident/other/datahandler/Topichelper.dart';

class TopicChooser extends StatefulWidget {
  @override
  _TopicChooserState createState() => _TopicChooserState();
}

class _TopicChooserState extends State<TopicChooser> {
  bool isExpanded = false;

  Widget topicList(String suchString) {
    return Padding(
      padding: EdgeInsets.only(top: 18.0, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: TopicHelper()
            .topics(
              startsWith: suchString,
            )
            .map((topic) => 
              //TODO: on click open Topic-Room
              Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(topic.name),
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (!isExpanded) {
          Navigator.pop(context);
        }
        setState(() {
          isExpanded = false;
        });
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: GiantButton(
          //height: isExpanded ? 300 : 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              isExpanded ? topicList("hu") : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Einem Themenraum beitreten',
                        hintStyle: TextStyle(
                          color: Theme.of(context).textTheme.headline1.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
