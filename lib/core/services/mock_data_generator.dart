import 'dart:math';

class MockDataGenerator {
  static final _random = Random();

  static final _plantNames = [
    'fern',
    'cacti-and-succulent',
    'flowering',
    'vegetable-and-fruit',
    'herb',
    'tree',
    'shrub',
    'groundcover',
    'edible',
    'bamboo',
    'moss',
    'vine',
    'aquatic',
    'desert',
    'tropical',
    'alpine',
  ];

  static final _plantTitles = [
    'Ferns',
    'Cacti and Succulents',
    'Flowering Plants',
    'Vegetables and Fruits',
    'Herbs',
    'Trees',
    'Shrubs',
    'Groundcover',
    'Edible Plants',
    'Bamboo Plants',
    'Mosses',
    'Vines',
    'Aquatic Plants',
    'Desert Plants',
    'Tropical Plants',
    'Alpine Plants',
  ];

  static final _imageHashes = [
    '6_edbcc6988a',
    '5_d2384a3938',
    '2_4a226c9ae7',
    '4_31ed0235a1',
    '3_f1a2b3c4d5',
    '7_e8f9g0h1i2',
    '8_j3k4l5m6n7',
    '9_o8p9q0r1s2',
  ];

  static final _questionTitles = [
    'How to identify plants?',
    'Differences Between Species and Varieties?',
    'The reasons why the same plant can look different?',
    'What are the best indoor plants for beginners?',
    'How to take care of succulents?',
    'When should you water your plants?',
    'How to fertilize your garden plants?',
    'What tools do you need for gardening?',
    'How to prevent plant diseases?',
    'Best plants for air purification?',
  ];

  static final _questionSubtitles = [
    'Life Style',
    'Plant Identify',
    'Gardening Tips',
    'Indoor Plants',
    'Plant Care',
    'Watering Guide',
    'Plant Health',
  ];

  static final _questionImages = [
    'https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2FCard.png?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2Fcard2.png?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2FCard3.png?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2FCard4.png?alt=media',
    'https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2FCard5.png?alt=media',
  ];

  static final _questionUris = [
    'https://plantapp.app/blog/identifying-plant-in-10-steps/',
    'https://plantapp.app/blog/differences-between-species-and-varieties/',
    'https://plantapp.app/blog/same-seeds-but-different-looking-plants/',
    'https://plantapp.app/blog/best-indoor-plants-beginners/',
    'https://plantapp.app/blog/succulent-care-guide/',
    'https://plantapp.app/blog/when-to-water-plants/',
    'https://plantapp.app/blog/fertilizing-garden-plants/',
    'https://plantapp.app/blog/gardening-tools-essentials/',
    'https://plantapp.app/blog/prevent-plant-diseases/',
    'https://plantapp.app/blog/air-purifying-plants/',
  ];

  static Map<String, dynamic> generateCategoryResponse({required int page, required int pageSize, int? totalItems}) {
    final total = totalItems ?? 100; // Default total items for better lazy loading testing
    final totalPages = (total / pageSize).ceil();

    if (page > totalPages || page < 1) {
      throw Exception('Page $page not found. Available pages: 1-$totalPages');
    }

    final startIndex = (page - 1) * pageSize;
    final endIndex = (startIndex + pageSize > total) ? total : startIndex + pageSize;
    final itemsForPage = endIndex - startIndex;

    final categories = List.generate(itemsForPage, (index) {
      final actualIndex = startIndex + index;
      return _generateCategory(actualIndex + 1, actualIndex);
    });

    return {
      'data': categories,
      'meta': {
        'pagination': {'page': page, 'pageSize': pageSize, 'pageCount': totalPages, 'total': total},
      },
    };
  }

  static Map<String, dynamic> _generateCategory(int id, int rank) {
    final nameIndex = rank % _plantNames.length;
    final titleIndex = rank % _plantTitles.length;
    final hashIndex = rank % _imageHashes.length;

    final now = DateTime.now();
    final createdAt = now.subtract(Duration(days: _random.nextInt(365)));
    final updatedAt = createdAt.add(Duration(hours: _random.nextInt(24)));
    final publishedAt = createdAt.add(Duration(minutes: _random.nextInt(60)));

    return {
      'id': id,
      'name': '${_plantNames[nameIndex]}-$id',
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'publishedAt': publishedAt.toIso8601String(),
      'title': '${_plantTitles[titleIndex]} $id',
      'rank': rank,
      'image': _generateImage(hashIndex, createdAt, updatedAt),
    };
  }

  static Map<String, dynamic> _generateImage(int hashIndex, DateTime createdAt, DateTime updatedAt) {
    final hash = _imageHashes[hashIndex];
    final imageId = 20 + hashIndex;
    final width = 116 + _random.nextInt(50);
    final height = 126 + _random.nextInt(50);
    final size = 5.0 + _random.nextDouble() * 10.0;

    return {
      'id': imageId,
      'name': '${hashIndex + 1}.png',
      'alternativeText': null,
      'caption': null,
      'width': width,
      'height': height,
      'formats': null,
      'hash': hash,
      'ext': '.png',
      'mime': 'image/png',
      'size': double.parse(size.toStringAsFixed(2)),
      'url': 'https://cms-cdn.plantapp.app/$hash/$hash.png',
      'previewUrl': null,
      'provider': '@strapi-community/strapi-provider-upload-google-cloud-storage',
      'provider_metadata': null,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  static List<Map<String, dynamic>> generateQuestions({int count = 3}) {
    return List.generate(count, (index) => _generateQuestion(index + 1, index + 1));
  }

  static Map<String, dynamic> _generateQuestion(int id, int order) {
    final titleIndex = (id - 1) % _questionTitles.length;
    final subtitleIndex = (id - 1) % _questionSubtitles.length;
    final imageIndex = (id - 1) % _questionImages.length;
    final uriIndex = (id - 1) % _questionUris.length;

    return {
      'id': id,
      'title': _questionTitles[titleIndex],
      'subtitle': _questionSubtitles[subtitleIndex],
      'image_uri': _questionImages[imageIndex],
      'uri': _questionUris[uriIndex],
      'order': order,
    };
  }
}
