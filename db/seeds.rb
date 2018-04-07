User.create(
  name: 'PhatHdt',
  email: 'phathdt.leviateam@gmail.com',
  password: '123123123',
  password_confirmation: '123123123'
)

admin = User.first

user1 = User.create(
  name: 'Phat 123',
  email: 'droidmaxxx@gmail.com',
  password: '123123123',
  password_confirmation: '123123123'
)

user2 = User.create(
  name: 'Pool 123',
  email: 'phathdt@nustechnology.com',
  password: '123123123',
  password_confirmation: '123123123'
)

user3 = User.create(
  name: 'Pool 1234',
  email: 'vasco_sama@yahoo.com',
  password: '123123123',
  password_confirmation: '123123123'
)

User.all.each(&:confirm)

admin.add_role(:admin)

admin.restaurants.create(
  name: 'Food House',
  address: '800 Nguyễn Kiệm',
  desc: 'Đến hệ thống Food Center, Food House, Quý khách sẽ được thưởng thức nhiều món ăn ngon, hấp dẫn như: Lẩu chín tầng mây, Sườn khò Lava, Cánh gà Tomyum… Mỗi món ăn mang một hương vị riêng biệt, được chế biến bởi người đầu bếp tài hoa, dẫn dắt vị giác qua nhiều cung bậc cảm xúc khác nhau.',
  phone: '096 962 68 00',
  album_images_attributes: [
    {
      caption: 'Donec eleifend diam id turpis placerat, non dignissim nibh pretium',
      is_cover: true,
      temp_url: 'https://www.wien.info/media/images/50416-zu-den-3-hacken-restaurant-wiener-kueche-wiener-schnitzel.jpg/image_leading_article_teaser'
    },
    {
      caption: 'Aenean non dapibus leo. Donec odio justo, volutpat ut finibus a, tempor id nibh. Vivamus at elit non ligula lobortis sollicitudin eleifend ac risus',
      temp_url: 'http://www.realdetroitweekly.com/wp-content/uploads/2017/06/Restaurants.jpg'
    },
    {
      caption: 'Ut ac orci dignissim, fermentum lacus quis, gravida lorem. Phasellus eu nisl et quam eleifend ultrices. Proin hendrerit, nulla ut elementum pretium',
      temp_url: 'https://www.ashmolean.org/sites/default/files/styles/listing_landscape_textoverlay_left_bottom_image/public/ashmolean/images/media/cafe1.jpg?itok=RRq3Tds5'
    }
  ]
)

admin.restaurants.create(
  name: 'The Coffee House - Võ Văn Ngân',
  address: '14 Võ Văn Ngân, Quận Thủ Đức, Ho Chi Minh',
  desc: 'Không gian rộng rãi và thoải mái. Menu đa dạng với nhiều món nước ngon và hấp dẫn. Nhân viên vui vẻ và nhiệt tình.',
  phone: '028 7303 9079',
  album_images_attributes: [
    {
      caption: 'Donec eleifend diam id turpis placerat, non dignissim nibh pretium',
      is_cover: true,
      temp_url: 'https://libertyhouserestaurant.com/wp-content/uploads/sites/13/2016/11/slide-restaurant.jpg'
    },
    {
      caption: 'Aenean non dapibus leo. Donec odio justo, volutpat ut finibus a, tempor id nibh. Vivamus at elit non ligula lobortis sollicitudin eleifend ac risus',
      temp_url: 'http://d1dzqwexhp5ztx.cloudfront.net/imageRepo/4/0/80/27/139/IMG_0020_1_2_S.jpg'
    },
    {
      caption: 'Ut ac orci dignissim, fermentum lacus quis, gravida lorem. Phasellus eu nisl et quam eleifend ultrices. Proin hendrerit, nulla ut elementum pretium',
      temp_url: 'https://www.breezedevelopment.co.uk/wp-content/uploads/2017/07/CroppedImage1600900-restaurant-alpenhof-zermatt.jpg'
    }
  ]
)

admin.restaurants.create(
  name: 'Highlands Coffee - Tân Sơn Nhì',
  address: '370-372 Tân Sơn Nhì, Tân Phú, Hồ Chí Minh',
  desc: 'Uống Coffe cùng đồng bạn',
  phone: '028 3812 2569',
  album_images_attributes: [
    {
      caption: 'Donec eleifend diam id turpis placerat, non dignissim nibh pretium',
      is_cover: true,
      temp_url: 'https://www.villalacoste.com/wp-content/uploads/2017/03/04b.jpg'
    },
    {
      caption: 'Aenean non dapibus leo. Donec odio justo, volutpat ut finibus a, tempor id nibh. Vivamus at elit non ligula lobortis sollicitudin eleifend ac risus',
      temp_url: 'https://1nsw6u.akamaized.net/application/files/1914/7340/5572/jabalakhdar-juniper-restaurant.jpg'
    },
    {
      caption: 'Ut ac orci dignissim, fermentum lacus quis, gravida lorem. Phasellus eu nisl et quam eleifend ultrices. Proin hendrerit, nulla ut elementum pretium',
      temp_url: 'http://englishlakes.co.uk/media/1292/dsc_0009.jpg'
    }
  ]
)

r = Restaurant.first
r1 = r.manager_requests.create(manager: user1)
r1.approve!
r2 = r.manager_requests.create(manager: user2)
r2.comment = 'ko thich nha hang nay'
r2.reject!
r3 = r.manager_requests.create(manager: user3)
r3.approve!
r3.comment = 'lam viec chan qua'
r3.retire!

r.dishes.create(
  name: "Americano",
  description: "phong cách cà phê chuẩn bị bằng cách thêm nước nóng vào espresso, điều này làm cà phê có độ đậm tương tự, nhưng hương vị lại khác, giống cà phê phin. Độ đạm của một tách Americano thay đổi theo số lượng tách espresso và lượng nước bổ sung.",
  price: 44000,
  temp_url: "http://cowboysplace.com.vn/wp-content/uploads/2017/08/3c7c1ccfbbd6002683b8a4ff019f4f95.jpeg"
)

r.dishes.create(
  name: "Capuchino",
  description: " Một cà phê cappuccino bao gồm ba phần đều nhau: cà phê espresso pha với một lượng nước gấp đôi (espresso lungo), sữa nóng và sữa sủi bọt. Để hoàn thiện khẩu vị, người ta thường rải lên trên tách cà phê cappuccino là bột ca cao và/hay bột quế. Trong các quán cà phê ở Ý, người đứng bán ở bar (barista) thường dùng khuôn hay dùng thìa và bằng cách khuấy điệu nghệ trong lúc rắc bột để tạo thành các hình nghệ thuật.",
  price: 54000,
  temp_url: "https://i.ndtvimg.com/i/2017-02/coffee_620x318_41486141224.jpg"
)

r.dishes.create(
  name: "Freeze socola",
  description: "Béo ngậy với sô-cô-la và kem tươi, mát lạnh với đá bào đã tạo nên một ly freeze cà phê thật tuyệt vời. Đơn giản lắm, cùng thử nha!",
  price: 49000,
  temp_url: "http://familyfoodvietnam.com/web/media/k2/items/cache/c36ca621a5bd9f22ed82eb87110f16dc_L.jpg"
)

r.dishes.create(
  name: "Latte",
  description: "kiểu cà phê sữa của Ý, thường được uống trong bữa ăn sáng. Người Ý uống cà phê latte trong một cốc to, có khi đựng trong bát. Một cốc latte bao gồm 2 phần: espresso (khoảng 50 ml) và sữa bò tươi hâm nóng. Bọt sữa hiếm khi được sử dụng",
  price: 54000,
  temp_url: "http://izzibingvn425.chiliweb.org/wp-content/uploads/2017/10/latte-coffee-cup_1203-3395.jpg"
)
