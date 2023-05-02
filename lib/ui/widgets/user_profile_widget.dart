import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/update_profile.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateProfile()));
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      tileColor: Colors.green,
      title: const Text("Abdullah Al-Kafi"),
      subtitle: const Text("kaficsebaiust02@gmail.com"),
    );
  }
}