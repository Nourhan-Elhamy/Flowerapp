class OnboardingModel{
  final String backgroundImage;
  final String image;
  final String title;
  final String desc;
  final String buttonText;


  OnboardingModel(
  {
    required this.backgroundImage,
    required this.image,
    required this.buttonText,
    required this.title,
    required this.desc
}
      );

}
List <OnboardingModel> onboarding=[
  OnboardingModel(backgroundImage: "assets/images/Onboard  1.png", image: "assets/images/Group 239092.png", buttonText: "Next", title: "Donuts", desc: "Made by hand, from scratch\nwith love"),
  OnboardingModel(backgroundImage: "assets/images/Onboard  2.png", image: "assets/images/cake.png", buttonText: "Next", title: "Piece of cake", desc: "Made by hand, from scratch\nwith love"),
  OnboardingModel(backgroundImage: "assets/images/Onboard 4.png", image: "assets/images/Group 239097.png", buttonText: "Get Started", title: "Milkshake", desc: "Made by hand, from scratch\nwith love"),

];