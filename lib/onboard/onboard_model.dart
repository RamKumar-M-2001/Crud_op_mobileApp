class OnboardModel {
  String header;
  String imagePath;
  String body;

  OnboardModel(
      {required this.header, required this.imagePath, required this.body});

  // List<OnboardModel> screens = [
  //   OnboardModel(
  //       header: "Proven \n specialists",
  //       imagepath: "assets/images/o1.png",
  //       body: "We check each specialist before \nhe starts work"),
  //   OnboardModel(
  //       header: "Honest \nratings",
  //       imagepath: "assets/images/o2.png",
  //       body: "We carefully check each specialist and put honest ratings"),
  //   OnboardModel(
  //       header: "Insured \n orders ",
  //       imagepath: "assets/images/o3.png",
  //       body: r"We insure each order for the amount of $500"),
  //   OnboardModel(
  //       header: "Create \n order ",
  //       imagepath: "assets/images/o4.png",
  //       body: "It's easy, just click on the plus"),
  // ];
}
