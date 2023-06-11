import 'package:flutter/material.dart';
import 'package:task_manager/Data/auth_utils.dart';
import 'package:task_manager/ui/screens/log_in_screen.dart';
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
      title:  Text('${AuthUtils.firstName ?? ''} ${AuthUtils.lastName ?? ''}'),
      subtitle:  Text(AuthUtils.email ?? 'Unknown'),
      trailing: IconButton(
        icon: const Icon(Icons.logout,color: Colors.white,),
        onPressed: ()
        {
          AuthUtils.clearAllData();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LogInScreen()), (route) => false);
        },
      ),
    );
  }
}