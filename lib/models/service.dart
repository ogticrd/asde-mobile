class Service {
  final int id;
  final String title;
  final String image;
  final String description;
  final String public;
  final String offerer;
  final String tel;
  final List<String> email;
  final List<String> requirements;
  final List<String> procedures;
  final String availableDays;
  final String availableTime;
  final String cost;
  final String expectedTime;
  final String deliveryChannel;
  final List<AdditionalInformation> additionalInformation;

  Service({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.public,
    required this.offerer,
    required this.tel,
    required this.email,
    required this.requirements,
    required this.procedures,
    required this.availableDays,
    required this.availableTime,
    required this.cost,
    required this.expectedTime,
    required this.deliveryChannel,
    required this.additionalInformation,
  });
}

class AdditionalInformation {
  final String text;
  final bool isBold;
  final String color;

  AdditionalInformation({
    required this.text,
    required this.isBold,
    required this.color,
  });
}
