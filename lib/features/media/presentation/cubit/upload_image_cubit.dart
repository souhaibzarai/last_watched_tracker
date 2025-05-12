import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/services/cloudinary.dart';
import '../../../../utils/messages/message_en.dart';

class UploadImageCubit extends Cubit<XFile?> {
  UploadImageCubit() : super(null);

  XFile? pickedImage;

  final CloudinaryService _cloudinaryService = CloudinaryService();
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      emit(XFile(pickedImage!.path));
    }
  }

  Future<Either<String, String>> getImageUrl(XFile? image) async {
    if (image == null) {
      return Left(CommonMessagesEn.noImageSelected);
    }
    try {
      final imageUrl = await _cloudinaryService.uploadImage(File(image.path));

      return Right(imageUrl);
    } catch (e) {
      return Left(CommonMessagesEn.uploadErrorMessage);
    }
  }
}
