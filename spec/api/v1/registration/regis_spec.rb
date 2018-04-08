require 'rails_helper'

RSpec.describe 'Registration' do
  describe "Sign up" do
    it "return missing params" do
      post('/api/v1/users/sign_up')
      json = JSON.parse(response.body)
      expect(response.status).to eql(500)
      expect(json['error']['message']).to eql(I18n.t('actioncontroller.errors.messages.missing_params'))
    end

    it "return a message password not match" do
      params = {
        "users": {
          "email": "user@mail.com",
          "password": "123123",
          "password_confirmation": "123123123",
          "name": "user name"
        }
      }
      post('/api/v1/users/sign_up', params: params)
      json = JSON.parse(response.body)
      expect(response.status).to eql(422)
      expect(json['errors']).to eql('Xác nhận mật khẩu không khớp với xác nhận')
    end

    it "return a confirm message" do
      params = {
        "users": {
          "email": "user@mail.com",
          "password": "123123123",
          "password_confirmation": "123123123",
          "name": "user name"
        }
      }
      post('/api/v1/users/sign_up', params: params)
      json = JSON.parse(response.body)
      expect(response.status).to eql(200)
      expect(json['notice']).to eql(I18n.t('devise.registrations.signed_up_but_inactive'))
    end

    it "return a message email has exist" do
      params = {
        "users": {
          "email": "user@mail.com",
          "password": "123123123",
          "password_confirmation": "123123123",
          "name": "user name"
        }
      }
      post('/api/v1/users/sign_up', params: params)
      json = JSON.parse(response.body)
      expect(response.status).to eql(422)
      expect(json['errors']).to eql(I18n.t('errors.format',
       attribute: 'Email',
       message: I18n.t('errors.messages.taken'))
      )
    end

    it "return a message name has exist" do
      params = {
        "users": {
          "email": "another_user@mail.com",
          "password": "123123123",
          "password_confirmation": "123123123",
          "name": "user name"
        }
      }
      post('/api/v1/users/sign_up', params: params)
      json = JSON.parse(response.body)
      expect(response.status).to eql(422)
      expect(json['errors']).to eql(I18n.t('errors.format',
       attribute: I18n.t('activerecord.attributes.user.name'),
       message: I18n.t('errors.messages.taken'))
      )
    end
  end
end
