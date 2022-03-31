import 'package:checkinpromobile/src/screens/MainNotifier.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class GuildLineData {
  String imgUrl;
  String title;
  String description;
  bool isShow;

  GuildLineData(this.imgUrl, this.title, this.description,
      {this.isShow = false});
}

class GuildLineNotifier extends MainNotifier {
  bool isLoading = false;
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  final List<GuildLineData> imgList = [
    GuildLineData('assets/images/guild-1.jpg', 'Title 1',
        'Another word for authentic. Find more ways to say authentic, along with related words, antonyms and example phrases at Thesaurus.com'),
    GuildLineData('assets/images/guild-2.jpg', 'Title 2',
        'Giá thành sản phẩm của các siêu thị tiện lợi cũng “nhỉnh” hơn so với các mô hình kinh doanh cửa hàng tạp hóa hay siêu thị mini.'),
    GuildLineData('assets/images/guild-3.jpg', 'Title 3',
        'Circle K is a convenience store chain offering a wide variety of products for people on the go. If you are looking for a great cup of coffee, a cold beverage'),
    GuildLineData('assets/images/guild-4.jpg', 'Title 4',
        'Another word for authentic. Find more ways to say authentic, along with related words, antonyms and example phrases at Thesaurus.com'),
    GuildLineData('assets/images/guild-5.jpg', 'Title 5',
        'Circle K (formerly Topaz) is a convenience store chain offering a wide variety of products for people on the go. If you are looking for a great cup of coffee'),
  ];
}
