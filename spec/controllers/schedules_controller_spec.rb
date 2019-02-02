require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do
  describe '#index' do
    context '認証済みユーザ' do
      before do
        @user = FactoryBot.create(:user)
      end

      it 'GETメソッドが成功する' do
        sign_in @user
        get :index
        expect(response).to be_successful
      end

      it 'GETメソッドのステータスコードが200である' do
        sign_in @user
        get :index
        expect(response).to have_http_status '200'
      end
    end

    context '未認証ユーザ' do
      it '認証ページにリダイレクトされる' do
        sign_in nil
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'GETメソッドのステータスコードが302である' do
        sign_in nil
        get :index
        expect(response).to have_http_status '302'
      end
    end
  end

  describe '#update' do
    context '認証済みユーザ' do
      before do
        @user = FactoryBot.create(:user)
        @schedule = FactoryBot.create(:schedule, user: @user)
      end

      it 'PATCHメソッドが成功する' do
        sign_in @user
        patch :update, params: { id: @schedule.id, start_date_time: DateTime.now }, xhr: true
        expect(response).to be_successful
      end

      it 'PATCHメソッドのステータスコードが200である' do
        sign_in @user
        patch :update, params: { id: @schedule.id, start_date_time: DateTime.now }, xhr: true
        expect(response).to have_http_status '200'
      end
    end

    context '未認証ユーザ' do
      before do
        @schedule = FactoryBot.create(:schedule, user: FactoryBot.create(:user))
      end

      it 'PATCHメソッドのステータスコードが401である' do
        sign_in nil
        patch :update, params: { id: @schedule.id, start_date_time: DateTime.now }, xhr: true
        expect(response).to have_http_status '401'
      end
    end
  end

  describe '#create' do
    context '認証済みユーザ' do
      before do
        @user = FactoryBot.create(:user)
      end

      it '設定値が正しい場合登録に成功する' do
        sign_in @user
        schedule_params = FactoryBot.attributes_for(:schedule)
        expect {
          post :create, params: { schedule: schedule_params }
        }.to change(@user.schedules, :count).by(1)
      end

      it '設定値に不備がある場合登録に失敗する' do
        sign_in @user
        schedule_params = FactoryBot.attributes_for(:schedule, :start_now)
        expect {
          post :create, params: { schedule: schedule_params }
        }.to_not change(@user.schedules, :count)
      end
    end

    context '未認証ユーザ' do
      it '認証ページにリダイレクトされる' do
        sign_in nil
        schedule_params = FactoryBot.attributes_for(:schedule)
        post :create, params: { schedule: schedule_params }
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'POSTメソッドのステータスコードが302である' do
        sign_in nil
        schedule_params = FactoryBot.attributes_for(:schedule)
        post :create, params: { schedule: schedule_params }
        expect(response).to have_http_status '302'
      end
    end
  end

  describe '#destroy' do
    context '認証済みユーザ' do
      before do
        @user = FactoryBot.create(:user)
        @schedule = FactoryBot.create(:schedule, user: @user)
      end

      it '予定の削除に成功する' do
        sign_in @user
        expect {
          delete :destroy, params: { id: @schedule.id }
        }.to change(@user.schedules, :count).by(-1)
      end

      it '予定の削除に成功するとトップページにリダイレクトされる' do
        sign_in @user
        delete :destroy, params: { id: @schedule.id }
        expect(response).to redirect_to root_path
      end
    end

    context '未認証ユーザ' do
      before do
        @schedule = FactoryBot.create(:schedule)
      end

      it '予定の削除に失敗する' do
        sign_in nil
        expect {
          delete :destroy, params: { id: @schedule.id }
        }.to_not change(Schedule, :count)
      end

      it 'DELETEメソッドのステータスコードが302である' do
        sign_in nil
        delete :destroy, params: { id: @schedule.id }
        expect(response).to have_http_status '302'
      end
    end
  end
end
