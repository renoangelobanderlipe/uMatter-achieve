import 'package:flutter/material.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/views/home_page/my_diary/my_diary_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDiaryPage extends StatefulWidget {
  const AddDiaryPage({
    Key? key,
  }) : super(key: key);

  @override
  _AddDiaryPageState createState() => _AddDiaryPageState();
}

class _AddDiaryPageState extends State<AddDiaryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final databaseManager = DatabaseManager();
  String emoji = SharePrefConfig.getEmoji() ?? "Happy";
  String title = '';
  String desc = '';
  Color bgColor = Colors.white;
  List<String> reasonList = SharePrefConfig.getReasons() ?? [];

  // Snackbar

  final message = const SnackBar(
    content: Text('Save'),
  );

  final myEmotions = [
    "😄 Happy",
    "😭 Crying",
    "😎 Cool",
    "😍 Love",
    "😱 Shock",
    "😴 Sleepy",
    "🤔 Thinking",
    "😔 Tired",
    "🙁 Lonely",
    "😡 Angry",
    "😇 Blessed",
    "😥 Exhausted",
    "🤤 Drooling"
  ];

  final ktextStyle = const TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    letterSpacing: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.grey[600],
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: Column(
              children: [
                _buildForm(_size),
                SizedBox(
                  height: _size.height * 0.1,
                ),
                _buildButtonSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Title and Notes description
  _buildForm(Size size) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmotion(),
          const SizedBox(
            height: 50.0,
          ),
          _buildTitleForm(),
          const SizedBox(
            height: 50.0,
          ),
          _buildDescForm(),
        ],
      ),
    );
  }

  _buildEmotion() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.orange[300],
          ),
          child: selectedEmoji(),
        ),
        const Spacer(),
      ],
    );
  }

  _buildTitleForm() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          filled: true,
          fillColor: Colors.grey[300],
          hintText: "Title...",
          hintStyle: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          )

          // filled: true,
          ),
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
      validator: (value) =>
          value != null && value.isEmpty ? "Please enter a title" : null,
      onChanged: (_val) {
        title = _val;
      },
    );
  }

  // Description
  _buildDescForm() {
    return TextFormField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(20.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        fillColor: Colors.grey[300],
        filled: true,
        border: InputBorder.none,
        hintText: "Add some notes...",
        hintStyle: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
      validator: (value) =>
          value != null && value.isEmpty ? "Please enter a note" : null,
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      onChanged: (_val) {
        desc = _val;
      },
    );
  }

  _buildButtonSubmit() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Calling the Database manager'
            ScaffoldMessenger.of(context).showSnackBar(message);
            databaseManager.addForm(title, desc, _formKey, emoji, context);

            CollectionReference ref = FirebaseFirestore.instance
                .collection('users')
                .doc('journal')
                .collection('notes');

            // Create user data
            var data = {
              'title': title,
              'description': desc,
              'created': DateTime.now(),
              'emotions': emoji.toString(),
            };
            // Validate Form
            ref.add(data);

            CollectionReference emotionRef = FirebaseFirestore.instance
                .collection('users')
                .doc('emotions')
                .collection('emotions-list');

            // Create user data
            var emotionData = {
              'emotions': emoji.toString(),
            };

            // Validate Form
            emotionRef.add(emotionData);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyDiaryPage(),
              ),
            );
            // Navigator.of(context).pop();
          } else {
            return;
          }
        },
        style: ElevatedButton.styleFrom(
          primary: kbtnColor,
          padding: const EdgeInsets.all(25.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text(
          'Save',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
        ),
      ),
    );
  }

  // Emoji Logic
  selectedEmoji() {
    if (emoji.toString() == "Happy") {
      return Text(myEmotions[0], style: ktextStyle);
    }
    if (emoji.toString() == "Crying") {
      return Text(myEmotions[1], style: ktextStyle);
    }
    if (emoji.toString() == "Cool") {
      return Text(myEmotions[2], style: ktextStyle);
    }
    if (emoji.toString() == "Love") {
      return Text(myEmotions[3], style: ktextStyle);
    }
    if (emoji.toString() == "Shock") {
      return Text(myEmotions[4], style: ktextStyle);
    }
    if (emoji.toString() == "Sleepy") {
      return Text(myEmotions[5], style: ktextStyle);
    }
    if (emoji.toString() == "Thinking") {
      return Text(myEmotions[6], style: ktextStyle);
    }
    if (emoji.toString() == "Tired") {
      return Text(myEmotions[7], style: ktextStyle);
    }
    if (emoji.toString() == "Lonely") {
      return Text(myEmotions[8], style: ktextStyle);
    }
    if (emoji.toString() == "Blessed") {
      return Text(myEmotions[9], style: ktextStyle);
    }
    if (emoji.toString() == "Love") {
      return Text(myEmotions[10], style: ktextStyle);
    }
    if (emoji.toString() == "Exhausted") {
      return Text(myEmotions[11], style: ktextStyle);
    }
    if (emoji.toString() == "Drooling") {
      return Text(myEmotions[12], style: ktextStyle);
    }
  }
}
