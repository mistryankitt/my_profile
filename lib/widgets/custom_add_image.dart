// // ignore_for_file: file_names, unused_element

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_profile/generated/assets.dart';

// class AddImageForm extends StatefulWidget {
//   final String? imagePath;
//   final String? imageUrl;
//   final String? placeholderImagePath;
//   final Function(String)? onChanged;

//   const AddImageForm({
//     Key? key,
//     this.imagePath,
//     this.imageUrl,
//     this.placeholderImagePath,
//     @required this.onChanged,
//   }) : super(key: key);

//   @override
//   State<AddImageForm> createState() => _AddImageFormState();
// }

// class _AddImageFormState extends State<AddImageForm> {
//   @override
//   Widget build(BuildContext context) {
//     Widget placeholder = Container(
//       height: 100,
//       width: 100,
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(8),
//         image: DecorationImage(
//             scale: 2.sp,
//             fit: BoxFit.fill,
//             image: widget.imageUrl == null
//                 ? AssetImage(
//                     widget.placeholderImagePath ?? Assets.imageProfile,
//                   ) as ImageProvider
//                 : NetworkImage(
//               widget.imageUrl!,
//                   )),
//       ),
//     );
//     return GestureDetector(
//         onTap: () => _showSelectionDialog(context),
//         child: widget.imagePath == null
//             ? placeholder
//             : _ImageWidget(
//                 image: widget.imagePath,
//               ));
//   }

//   _onAddImage(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       builder: (context) => Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             height: 50.h,
//             child: GestureDetector(
//               onTap: () => _showCamera(context),
//               child: const Text('Add from Camera'),
//             ),
//           ),
//           SizedBox(
//             height: 50.h,
//             child: GestureDetector(
//               onTap: () => _showGallery(context),
//               child: const Text('Add from Library'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _showSelectionDialog(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//               content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 GestureDetector(
//                   child: const Text("gallery"),
//                   onTap: () {
//                     _showGallery(context);
//                   },
//                 ),
//                 const Padding(padding: EdgeInsets.all(8.0)),
//                 GestureDetector(
//                   child: const Text("camera"),
//                   onTap: () {
//                     _showCamera(context);
//                   },
//                 )
//               ],
//             ),
//           ));
//         });
//   }

//   _showCamera(BuildContext context) {
//     Navigator.of(context).pop();
//     _showImagePicker(ImageSource.camera);
//   }

//   _showGallery(BuildContext context) {
//     Navigator.of(context).pop();
//     _showImagePicker(ImageSource.gallery);
//   }

//   _showImagePicker(ImageSource imageSource) async {
//     ImageP imagePicker = ImagePicker();
//     PickedFile? image =
//         // ignore: deprecated_member_use

//         await imagePicker.getImage(source: imageSource, imageQuality: 60);
//     if (image != null) {
//       widget.onChanged!(image.path);
//     }
//   }
// }

// class _ImageWidget extends StatelessWidget {
//   final String? image;

//   const _ImageWidget({
//     Key? key,
//     this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool validURL = Uri.parse(image!).isAbsolute;
//     return SizedBox(
//       height: 100,
//       width: 100,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: validURL
//             ? Image.network(
//                  image!,
//                 fit: BoxFit.cover,
//               )
//             : Image.file(
//                 File(image!),
//                 fit: BoxFit.cover,
//               ),
//       ),
//     );
//   }
// }
