import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meeting_methods.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    print("data");
    var random = Random();
    String roomName = (random.nextInt(100000000)+1000000000).toString();
    _jitsiMeetMethods.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: "New Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.add_box_rounded,
              text: "Join Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: "Schedule",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward_rounded,
              text: "Share Screen",
            ),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            "Create/Join Meetings with just a click!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ))
      ],
    );
  }
}
