import 'package:food_recipe_app/data/data_source/profile/profile_data_source.dart';
import 'package:food_recipe_app/domain/model/profile.dart';

class MockProfileDataSource implements ProfileDataSource {
  final List<Profile> _data = [
    const Profile(
      id: 1,
      name: 'Chef John',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'Lagos, Nigeria',
    ),
    const Profile(
      id: 2,
      name: 'Mark Kelvin',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'Abuja, Nigeria',
    ),
    const Profile(
      id: 3,
      name: 'Spicy Nelly',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'Ibadan, Nigeria',
    ),
    const Profile(
      id: 4,
      name: 'Kim Dahee',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'Seoul, South Korea',
    ),
    const Profile(
      id: 5,
      name: 'Alice Johnson',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'New York, USA',
    ),
    const Profile(
      id: 6,
      name: 'Gordon Ramsay',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'London, UK',
    ),
    const Profile(
      id: 7,
      name: 'Mario Batali',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'Rome, Italy',
    ),
    const Profile(
      id: 8,
      name: 'Jiro Ono',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'Tokyo, Japan',
    ),
    const Profile(
      id: 9,
      name: 'Julia Child',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'Paris, France',
    ),
    const Profile(
      id: 10,
      name: 'Paul Hollywood',
      image:
          'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'London, UK',
    ),
  ];

  @override
  Future<List<Profile>> getProfiles() async {
    return _data;
  }
}
