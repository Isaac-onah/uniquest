class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [

  UnbordingContent(
    title: 'Order with Ease',
    image: 'images/onboard.jpg',
    discription: "Effortlessly choose and place your favorite dish orders."
  ),
  UnbordingContent(
    title: 'Secure Payments',
    image: 'images/onboard2.jpg',
    discription: "Enjoy confidence in your transactions with our versatile and reliable payment options."
  ),
  UnbordingContent(
      title: 'Fast Delivery',
      image: 'images/onboard1.jpg',
      discription: "Get your food faster than you can set the table"
  ),
];
