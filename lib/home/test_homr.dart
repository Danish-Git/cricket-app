// Stack(
// children: [
// SizedBox(
// height: 190,
// width: Get.width * 0.87,
// child: CarouselSlider(
// items: controller.imageSliders,
// carouselController: controller.carouselController,
// options: CarouselOptions(
// autoPlay: false,
// enlargeCenterPage: true,
// aspectRatio: 2.0,
// onPageChanged: (index, reason) {
// controller.onCarouselItemChange(index);
// }),
// ),
// ),
// Positioned(
// bottom: 12,
// left: 0,
// right: 0,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children:
// controller.imgList.asMap().entries.map((entry) {
// return Container(
// width: 22,
// height: 5,
// margin:
// const EdgeInsets.symmetric(horizontal: 2.0),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// color: controller.currentIndex == entry.key
// ? Colors.white
//     : Colors.grey,
// ),
// );
// }).toList(),
// ),
// ),
// ],
// ),
// Text(
// "Question",
// style: TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.w500,
// color: ColorConstants().redColor,
// ),
// ),
// const Divider(
// color: Color.fromRGBO(0, 0, 0, 0.07),
// thickness: 1,
// indent: 32,
// endIndent: 32,
// ),
// Text(
// "Who is the winner of the WC 2017?",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w500,
// color: ColorConstants().redColor,
// ),
// ),
// ],
// ),
// ),
// const Padding(
// padding: EdgeInsets.only(left: 24, top: 24, bottom: 8),
// child: Row(
// children: [
// Text(
// "Select your team",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w600,
// color: Color.fromRGBO(0, 0, 0, 1),
// ),
// ),
// ],
// ),
// ),
// Stack(
// children: [
// SizedBox(
// height: 100,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: controller.imgList.length,
// itemBuilder: (BuildContext context, int index) {
// return ContainerItem(
// imgName: controller.imgList[index],
// label: index.toString(),
// );
// }),
// ),
// Positioned(
// right: 18,
// top: 30,
// bottom: 30,
// child: GestureDetector(
// onTap: () {},
// child: Container(
// width: 40,
// decoration: BoxDecoration(
// color: ColorConstants().greenColor,
// borderRadius: BorderRadius.circular(6),
// ),
// child: const Icon(
// Icons.keyboard_arrow_right_sharp,
// color: Colors.white,
// size: 36,
// ),
// ),
// ),
// )
// ],
// ),



// const DecoratedBox(
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(32),
// bottomRight: Radius.circular(32),
// ),
// boxShadow: [
// BoxShadow(
// color: Colors.greenAccent,
// offset: Offset(0, 0),
// spreadRadius: 2,
// blurRadius: 2,
// ),
// ],
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [],
// ),
// ),



/*

  void addUpComingTournaments() {
    for (var item in tournamentList) {
      if (item.Type == 'Running') {
        upComingTournament.add(
          Container(
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                item.Banner.isNotEmpty ? item.Banner : imgList[0],
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
          ),
        );
      } else if (item.Type == 'Running') {
        runningTournament.add(
          Container(
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                item.Banner.isNotEmpty ? item.Banner : imgList[0],
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
          ),
        );
      } else if (item.Type == 'Running') {
        completeTournament.add(
          Container(
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                item.Banner.isNotEmpty ? item.Banner : imgList[0],
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
          ),
        );
      }

      if (item.Type == 'Running') {
        cancelTournament.add(
          Container(
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                item.Banner.isNotEmpty ? item.Banner : imgList[0],
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
          ),
        );
      }
    }

    isLoading = false;
    update();
  }
*
*
* */


/*class ContainerItem extends StatelessWidget {
  final String imgName;
  final String label;

  const ContainerItem({super.key, required this.imgName, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      padding: const EdgeInsets.only(left: 22, right: 22, top: 6),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 247, 247, 1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color.fromRGBO(0, 116, 56, 0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgName),
            radius: 30,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(34, 34, 34, 1),
            ),
          )
        ],
      ),
    );
  }
}*/
