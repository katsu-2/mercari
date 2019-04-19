require 'rails_helper'

describe ItemsController do
  let(:user) {create(:user)}
  let(:item) {create(:item, user_id: user.id)}

  describe 'GET #new' do
    it "has a 200 status code" do
      get :new
      expect(response).to render_template :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it "has a 200 status code" do
      get :show, params: { id: item.id }
      expect(response).to render_template :show
      expect(response).to have_http_status(:ok)
    end
  end
end
