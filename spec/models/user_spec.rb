require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録機能' do
    context '新規登録成功' do
      it '必要な項目を全て入力している' do
      end
      it 'パスワードは6文字以上で登録できる' do
      end
    end
    context '新規登録失敗' do
      it 'nicknameが未入力だと登録できない' do
      end
      it 'emailが未入力だと登録できない' do
      end
      it '重複するemailが存在すると登録できない' do
      end
      it 'passwordが未入力だと登録できない' do
      end
      it 'passwordが5文字以下で登録できない' do
      end
    end
  end
end
