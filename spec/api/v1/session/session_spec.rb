require 'rails_helper'

RSpec.describe 'Session' do
  User.create(
    name: 'LinhNguyen',
    email: 'truclinh61196@gmail.com',
    password: '123123123',
    password_confirmation: '123123123'
  )

  describe 'Sign in' do
    it 'param null' do
      post '/api/v1/users/sign_in'
      json = JSON.parse(response.body)
      expect(response.status).to eql(500)
      expect(json['error']['message']).to eql('Thiếu params rồi kìa')
    end

    it 'login account do not sign up' do
      params = {
        "users": {
          "email": 'truclinh61@gmail.com',
          "password": '123123123'
        }
      }
      post('/api/v1/users/sign_in', params: params)
      json = JSON.parse(response.body)
      expect(response.status).to eql(422)
      expect(json['message']).to eql('Email hoặc mật khẩu không chính xác.')
    end

    it 'login with invalid password' do
      params = {
        "users": {
          "email": 'truclinh61196@gmail.com',
          "password": '123456'
        }
      }
      post('/api/v1/users/sign_in', params: params)
      json = JSON.parse(response.body)
      expect(response.status).to eql(422)
      expect(json['message']).to eql('Email hoặc mật khẩu không chính xác.')
    end
  end
end
