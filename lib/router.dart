import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:multi_stream_chat/controllers/message_controller.dart";
import "package:multi_stream_chat/pages/messages.dart";
import "package:multi_stream_chat/pages/settings.dart";

class MyRouter extends StatefulWidget {
  const MyRouter({super.key});

  @override
  State<MyRouter> createState() => _MyRouterState();
}

class _MyRouterState extends State<MyRouter> {
  final MessageController _messageController = Get.put(MessageController());

  final List<Widget> _widgetOptions = <Widget>[
    const MessagesPage(),
    const SettingsPage()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Test Message",
        onPressed: () => _messageController.addMessage(
          message: "Test Message",
          username: "Multi-Stream Chat",
          platform: "twitch",
        ),
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidMessage),
            label: "Messages",
            tooltip: "Messages",
            activeIcon: FaIcon(FontAwesomeIcons.solidMessage),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.gear),
            label: "Settings",
            tooltip: "Settings",
            activeIcon: FaIcon(FontAwesomeIcons.gear),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
