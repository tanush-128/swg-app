import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swg_flutter/models/Notice.dart';
// import 'notice.dart'; // Assuming your Notice class is in this file

class AddNoticePage extends StatefulWidget {
  const AddNoticePage({super.key});

  @override
  _AddNoticePageState createState() => _AddNoticePageState();
}

class _AddNoticePageState extends State<AddNoticePage> {
  final _formKey = GlobalKey<FormState>();
  String heading = '';
  String description = '';
  DateTime? eventTime;
  String location = '';
  String host = '';
  String? imageUrl;
  String targetAudience = 'All KGP Junta';
  bool published = false;
  String contactName = '';
  String contactNumber = '';
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final List<String> targetAudiences = [
    'All KGP Junta',
    'Freshers',
    'Sophomores',
    'Pre-Final Years',
    'Final Years'
  ];

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newNotice = Notice(
        heading: heading,
        description: description,
        eventTime: eventTime ?? DateTime.now(),
        location: location,
        host: host,
        imageUrl: _imageFile?.path,
        targetAudience: targetAudience,
        published: published,
      );
      await Notice.createNotice(newNotice);
      Navigator.pop(context); // Go back after submitting
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            border: const UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade700,
              ),
            ),
            contentPadding: const EdgeInsets.all(10),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            labelStyle: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Request to add notice'),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                Text("Event Details",
                    style: Theme.of(context).textTheme.headlineSmall),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Heading'),
                  onSaved: (value) => heading = value!,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a heading' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => description = value!,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a description' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Location'),
                  onSaved: (value) => location = value!,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a location' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Host'),
                  onSaved: (value) => host = value!,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter the host' : null,
                ),
                ListTile(
                  title: const Text("Event Date and Time"),
                  subtitle: Text(eventTime?.toString() ?? 'No date chosen'),
                  onTap: () async {
                    final chosenDate = await showDatePicker(
                      context: context,
                      initialDate: eventTime ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (chosenDate != null) {
                      final chosenTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              eventTime ?? DateTime.now()));
                      setState(() {
                        eventTime = DateTime(
                            chosenDate.year,
                            chosenDate.month,
                            chosenDate.day,
                            chosenTime?.hour ?? 0,
                            chosenTime?.minute ?? 0);
                      });
                    }
                  },
                ),
                DropdownButtonFormField(
                  value: targetAudience,
                  decoration:
                      const InputDecoration(labelText: 'Target Audience'),
                  items: targetAudiences.map((String audience) {
                    return DropdownMenuItem(
                      value: audience,
                      child: Text(audience),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      targetAudience = newValue!;
                    });
                  },
                ),
                ListTile(
                  title: const Text("Upload Image"),
                  subtitle: Text(_imageFile == null ? 'No image selected' : ""),
                  onTap: _pickImage,
                ),
                //display the image
                if (_imageFile != null)
                  Image.file(
                    File(_imageFile!.path),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                const SizedBox(height: 20),

                Text("Contact Details",
                    style: Theme.of(context).textTheme.headlineSmall),
                Text(
                  "This is not displayed to the public, rather used by SWG team to contact you in case of any issues",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onSaved: (value) => contactName = value!,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your name' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  onSaved: (value) => contactNumber = value!,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your phone number' : null,
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ));
  }
}
