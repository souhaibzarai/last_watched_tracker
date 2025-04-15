import 'dart:io';

import 'package:dio/dio.dart';

class CloudinaryService {
  final String cloudName = 'dfywchktg';
  final String uploadPreset = 'kbvu8npc';

  final Dio _dio = Dio();

  Future<String> uploadImage(File image) async {
    final url = 'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
        'upload_preset': uploadPreset,
      });

      final response = await _dio.post(url, data: formData);

      if (response.statusCode == 200) {
        return response.data['secure_url'];
      } else {
        throw Exception(
          'Échec du téléchargement de l\'image. Code de statut : ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Échec du téléchargement de l\'image : $e');
    }
  }
}
