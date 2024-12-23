

class Message {
  final User sender;
  final String? avatar;
  final String time;
  final int? unreadCount;
  final bool? isRead;
  final String text;

  Message({
    required this.sender,
    this.avatar,
    required this.time,
    this.unreadCount,
    required this.text,
    this.isRead,
  });
}

final List<Message> recentChats = [
  Message(
    sender: addison,
    avatar: 'assets/Addison.jpg',
    time: '01:25',
    text: "typing...",
    unreadCount: 1,
  ),
  Message(
    sender: jason,
    avatar: 'assets/Jason.jpg',
    time: '12:46',
    text: "Will I be in it?",
    unreadCount: 1,
  ),
  Message(
    sender: deanna,
    avatar: 'assets/Deanna.jpg',
    time: '05:26',
    text: "That's so cute.",
    unreadCount: 3,
  ),
  Message(
      sender: nathan,
      avatar: 'assets/Nathan.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      unreadCount: 2),
];

final List<Message> allChats = [
  Message(
    sender: virgil,
    avatar: 'assets/Virgil.jpg',
    time: '12:59',
    text: "No! I just wanted",
    unreadCount: 0,
    isRead: true,
  ),
  Message(
    sender: stanley,
    avatar: 'assets/Stanley.jpg',
    time: '10:41',
    text: "You did what?",
    unreadCount: 1,
    isRead: false,
  ),
  Message(
    sender: leslie,
    avatar: 'assets/Leslie.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: judd,
    avatar: 'assets/Judd.jpg',
    time: '10:16',
    text: "May I ask you something?",
    unreadCount: 2,
    isRead: false,
  ),
];

final List<Message> messages = [
  Message(
    sender: addison,
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "...",
  ),
  Message(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "I’m going home.",
  ),
  Message(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "See, I was right, this doesn’t interest me.",
  ),
  Message(
    sender: addison,
    time: '11:58 PM',
    avatar: addison.avatar,
    text: "I sign your paychecks.",
  ),
  Message(
    sender: addison,
    time: '11:58 PM',
    avatar: addison.avatar,
    text: "You think we have nothing to talk about?",
  ),
  Message(
    sender: currentUser,
    time: '11:45 PM',
    isRead: true,
    text:
    "Well, because I had no intention of being in your office. 20 minutes ago",
  ),
  Message(
    sender: addison,
    time: '11:30 PM',
    avatar: addison.avatar,
    text: "I was expecting you in my office 20 minutes ago.",
  ),
];

class User {
  final int id;
  final String name;
  final String avatar;

  User({
    required this.id,
    required this.name,
    required this.avatar,
  });
}

final User currentUser =
User(id: 0, name: 'You', avatar: 'assets/images/Addison.jpg');

final User addison =
User(id: 1, name: 'Addison', avatar: 'assets/images/Addison.jpg');

final User angel =
User(id: 2, name: 'Angel', avatar: 'assets/images/Angel.jpg');

final User deanna =
User(id: 3, name: 'Deanna', avatar: 'assets/images/Deanna.jpg');

final User jason = User(id: 4, name: 'Json', avatar: 'assets/images/Jason.jpg');

final User judd = User(id: 5, name: 'Judd', avatar: 'assets/images/Judd.jpg');

final User leslie =
User(id: 6, name: 'Leslie', avatar: 'assets/images/Leslie.jpg');

final User nathan =
User(id: 7, name: 'Nathan', avatar: 'assets/images/Nathan.jpg');

final User stanley =
User(id: 8, name: 'Stanley', avatar: 'assets/images/Stanley.jpg');

final User virgil =
User(id: 9, name: 'Virgil', avatar: 'assets/images/Virgil.jpg');