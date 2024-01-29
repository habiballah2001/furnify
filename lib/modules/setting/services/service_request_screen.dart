import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../shared/components.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_card.dart';
import '../../../shared/custom_widgets/custom_text_field.dart';

class ServiceRequestScreen extends StatefulWidget {
  const ServiceRequestScreen({Key? key}) : super(key: key);

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  final TextEditingController emailController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  File? image;

  Future<void> getImage() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    final image_ = File(pickedImage.path);
    setState(() {
      image = image_;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Request'),
      ),
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => getImage(),
              child: CustomCard(
                color: Colors.grey[300],
                //height: 200,
                width: double.infinity,
                child: image != null
                    ? Image.file(image!)
                    : const Icon(Icons.add_photo_alternate_outlined),
              ),
            ),
          ),
          const SpaceHeight(),
          Expanded(
            child: CustomTextField(
              maxLength: 120,
              maxLines: 10,
              controller: TextEditingController(),
              type: TextInputType.text,
              hint: 'service description...',
              validate: (value) {
                if (value!.isEmpty) {
                  return 'must be filled';
                }
                return null;
              },
            ),
          ),
          const Spacer(),
          CustomButton(
            height: 40,
            text: 'Submit',
            radius: 30,
            icon: Icons.login,
            function: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
