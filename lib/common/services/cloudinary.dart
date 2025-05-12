import 'dart:io';

import 'package:dio/dio.dart';
import '../../utils/messages/message_en.dart';

class CloudinaryService {
  final String _cloudNameValue = 'dluoluv8r';
  final String _uploadPresetValue = 'rekoro_app';

  final Dio _dio = Dio();

  Future<String> uploadImage(File image) async {
    final url = 'https://api.cloudinary.com/v1_1/$_cloudNameValue/image/upload';

    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
        'upload_preset': _uploadPresetValue,
      });

      final response = await _dio.post(url, data: formData);

      if (response.statusCode == 200) {
        return response.data['secure_url'];
      } else {
        throw Exception(
          '${CommonMessagesEn.uploadFailureMessage} ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('${CommonMessagesEn.uploadErrorMessage} $e');
    }
  }
}
