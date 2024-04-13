import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:my_portfolio/common/app_colors.dart';
import 'package:my_portfolio/common/ui_helpers.dart';
import 'package:my_portfolio/ui/widgets/skills/home_skills.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Contact',
          style: TextStyle(
            fontSize: getValueForScreenType<double>(
              context: context,
              mobile: 35,
              tablet: 35,
              desktop: 50
            ),
            fontWeight: FontWeight.w900,
            color: kcPrimaryColorDark,
          ),
        ),
        verticalSpaceSmall,
        SizedBox(
          width: getValueForScreenType(
            context: context,
            mobile: 305,
            desktop: 800,
            tablet: 500
          ),
          child: TextField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
            controller: _nameController,
          ),
        ),
        verticalSpaceSmall,
        SizedBox(
          width: getValueForScreenType(
            context: context,
            mobile: 305,
            desktop: 800,
            tablet: 500
          ),
          child: TextField(
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            controller: _emailController,
          ),
        ),
        verticalSpaceSmall,
        SizedBox(
          width: getValueForScreenType(
            context: context,
            mobile: 305,
            desktop: 800,
            tablet: 500
          ),
          child: TextField(
            minLines: null, // Set this
            maxLines: 10, // and this
            keyboardType: TextInputType.multiline,
            obscureText: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Message',
              alignLabelWithHint: true,
            ),
            controller: _messageController,
          ),
        ),
        verticalSpaceSmall,
        MyButton(
          text: 'Send',
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text(
                'Message Sent!',
                textAlign: TextAlign.center,
              ),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            _nameController.text = '';
            _messageController.text = '';
            _emailController.text = '';
          },
          width: 250,
          fontSize: 25,
        ),
        verticalSpaceMassive,
      ],
    );
  }
}