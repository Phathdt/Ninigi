User.create(
  name: 'PhatHdt',
  email: 'phathdt.leviateam@gmail.com',
  password: '123123123',
  password_confirmation: '123123123'
)

admin = User.first
admin.confirm

admin.add_role(:admin)

admin.restaurants.create(
  name: 'Food House',
  address: '800 Nguyễn Kiệm',
  desc: 'Đến hệ thống Food Center, Food House, Quý khách sẽ được thưởng thức nhiều món ăn ngon, hấp dẫn như: Lẩu chín tầng mây, Sườn khò Lava, Cánh gà Tomyum… Mỗi món ăn mang một hương vị riêng biệt, được chế biến bởi người đầu bếp tài hoa, dẫn dắt vị giác qua nhiều cung bậc cảm xúc khác nhau.',
  phone: '096 962 68 00',
  album_images_attributes: [
    {
      caption: "Donec eleifend diam id turpis placerat, non dignissim nibh pretium",
      is_cover: true,
      temp_url: "https://www.wien.info/media/images/50416-zu-den-3-hacken-restaurant-wiener-kueche-wiener-schnitzel.jpg/image_leading_article_teaser"
    },
    {
      caption: "Aenean non dapibus leo. Donec odio justo, volutpat ut finibus a, tempor id nibh. Vivamus at elit non ligula lobortis sollicitudin eleifend ac risus",
      temp_url: "http://www.realdetroitweekly.com/wp-content/uploads/2017/06/Restaurants.jpg"
    },
    {
      caption: "Ut ac orci dignissim, fermentum lacus quis, gravida lorem. Phasellus eu nisl et quam eleifend ultrices. Proin hendrerit, nulla ut elementum pretium",
      temp_url: "https://www.ashmolean.org/sites/default/files/styles/listing_landscape_textoverlay_left_bottom_image/public/ashmolean/images/media/cafe1.jpg?itok=RRq3Tds5"
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
      caption: "Donec eleifend diam id turpis placerat, non dignissim nibh pretium",
      is_cover: true,
      temp_url: "https://libertyhouserestaurant.com/wp-content/uploads/sites/13/2016/11/slide-restaurant.jpg"
    },
    {
      caption: "Aenean non dapibus leo. Donec odio justo, volutpat ut finibus a, tempor id nibh. Vivamus at elit non ligula lobortis sollicitudin eleifend ac risus",
      temp_url: "http://d1dzqwexhp5ztx.cloudfront.net/imageRepo/4/0/80/27/139/IMG_0020_1_2_S.jpg"
    },
    {
      caption: "Ut ac orci dignissim, fermentum lacus quis, gravida lorem. Phasellus eu nisl et quam eleifend ultrices. Proin hendrerit, nulla ut elementum pretium",
      temp_url: "https://www.breezedevelopment.co.uk/wp-content/uploads/2017/07/CroppedImage1600900-restaurant-alpenhof-zermatt.jpg"
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
      caption: "Donec eleifend diam id turpis placerat, non dignissim nibh pretium",
      is_cover: true,
      temp_url: "https://www.villalacoste.com/wp-content/uploads/2017/03/04b.jpg"
    },
    {
      caption: "Aenean non dapibus leo. Donec odio justo, volutpat ut finibus a, tempor id nibh. Vivamus at elit non ligula lobortis sollicitudin eleifend ac risus",
      temp_url: "https://1nsw6u.akamaized.net/application/files/1914/7340/5572/jabalakhdar-juniper-restaurant.jpg"
    },
    {
      caption: "Ut ac orci dignissim, fermentum lacus quis, gravida lorem. Phasellus eu nisl et quam eleifend ultrices. Proin hendrerit, nulla ut elementum pretium",
      temp_url: "http://parkresto.com/wp-content/themes/parkrestaurant/images/11onlinereservationpark.jpg"
    }
  ]
)
