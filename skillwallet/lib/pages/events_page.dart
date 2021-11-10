import 'package:flutter/material.dart';
import 'package:skillwallet/helpers/Common.dart';
import 'package:skillwallet/helpers/loading_screen.dart';
import 'package:skillwallet/models/events_model.dart';
import 'package:skillwallet/models/future_event.dart';
import 'package:skillwallet/models/past_event.dart';
import 'package:skillwallet/restapi/events_restapi.dart';

class EventsPage extends StatelessWidget {
  late Future<EventsModel?> future;
  String tokenID;

  EventsPage({Key? key, required this.tokenID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    future = EventsRestAPI().getEvents(tokenID);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Community Actions",
          style: Common.textStyle,
        ),
      ),
      body: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot<EventsModel?> data) {
            if (data.hasData) {
              return ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Open",
                        style: Common.textStyle.copyWith(fontSize: 16.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 174.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (FutureEvent event in data.data!.futureEvents!)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 239,
                                  height: 174,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(event.title!,
                                        style: Common.textStyle.copyWith(
                                            fontSize: 16.0,
                                            decoration:
                                                TextDecoration.underline)),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                for (String role
                                                    in event.roles!)
                                                  Text(role,
                                                      style: Common.textStyle
                                                          .copyWith(
                                                              fontSize: 12.0))
                                              ]),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Column(
                                            children: [
                                              Text("REP Credits",
                                                  style: Common.textStyle
                                                      .copyWith(
                                                          fontSize: 12.0)),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(children: [
                                                Image.asset(
                                                  "assets/images/coins-stack.png",
                                                  color: Colors.white,
                                                  width: 16,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(event.credits!.toString(),
                                                    style: Common.textStyle
                                                        .copyWith(
                                                            fontSize: 16.0))
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ])),
                            )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Completed",
                        style: Common.textStyle.copyWith(fontSize: 16.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 174.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (PastEvent event in data.data!.pastEvents!)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 239,
                                  height: 174,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                  ),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(event.title!,
                                        style: Common.textStyle.copyWith(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.underline)),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                for (String role
                                                    in event.roles!)
                                                  Text(role,
                                                      style: Common.textStyle
                                                          .copyWith(
                                                        fontSize: 12.0,
                                                        color: Colors.black,
                                                      ))
                                              ]),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Column(
                                            children: [
                                              Text("REP Credits",
                                                  style:
                                                      Common.textStyle.copyWith(
                                                    fontSize: 12.0,
                                                    color: Colors.black,
                                                  )),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(children: [
                                                Image.asset(
                                                  "assets/images/coins-stack.png",
                                                  color: Colors.black,
                                                  width: 16,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(event.credits!.toString(),
                                                    style: Common.textStyle
                                                        .copyWith(
                                                      fontSize: 16.0,
                                                      color: Colors.black,
                                                    ))
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ])),
                            )
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const LoadingScreen();
            }
          }),
    );
  }
}
