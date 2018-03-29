User.create(
  name: 'Phat',
  email: 'phathdt.leviateam@gmail.com',
  password: '123123123',
  password_confirmation: '123123123'
)

admin.add_role(:admin)

User.create(
  name: 'Pool',
  email: 'droidmaxxx@gmail.com',
  password: '123123123',
  password_confirmation: '123123123'
)

admin = User.first

admin.restaurants.create(
  name: 'Food House',
  address: '800 Nguyễn Kiệm',
  desc: 'Đến hệ thống Food Center, Food House, Quý khách sẽ được thưởng thức nhiều món ăn ngon, hấp dẫn như: Lẩu chín tầng mây, Sườn khò Lava, Cánh gà Tomyum… Mỗi món ăn mang một hương vị riêng biệt, được chế biến bởi người đầu bếp tài hoa, dẫn dắt vị giác qua nhiều cung bậc cảm xúc khác nhau.',
  phone: '096 962 68 00'
)

admin.restaurants.create(
  name: 'The Coffee House - Võ Văn Ngân',
  address: '14 Võ Văn Ngân, Quận Thủ Đức, Ho Chi Minh',
  desc: 'Không gian rộng rãi và thoải mái. Menu đa dạng với nhiều món nước ngon và hấp dẫn. Nhân viên vui vẻ và nhiệt tình.',
  phone: '028 7303 9079'
)

admin.restaurants.create(
  name: 'Highlands Coffee - Tân Sơn Nhì',
  address: '370-372 Tân Sơn Nhì, Tân Phú, Hồ Chí Minh',
  desc: 'Uống Coffe cùng đồng bạn',
  phone: '028 3812 2569'
)
