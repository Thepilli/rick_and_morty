import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/infrastructure/api_service/api_service.dart';

final apiProvider = Provider((ref) => ApiService());
