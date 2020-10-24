require 'rails_helper'
describe Customer do
  before do
    @customer = FactoryBot.build(:customer)
  end

  describe '顧客情報登録機能' do
    context '顧客情報登録成功' do
      it '必要な項目を全て入力していると登録できる' do
        expect(@customer).to be_valid
      end
      it '画像が選択されていなくても登録ができる' do
        @customer.image = nil
        expect(@customer).to be_valid
      end
      it '建物名が入力されていなくても登録ができる' do
        @customer.building = nil
        expect(@customer).to be_valid
      end
    end
    context '顧客情報登録失敗' do
      it '名前が入力されていないと登録できない' do
        @customer.first_name = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名前を入力してください', '名前は全角で入力してください')
      end
      it '名前が全角以外で入力されていると登録できない' do
        @customer.first_name = 'aaa'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名前は全角で入力してください')
      end
      it '名字が入力されていないと登録できない' do
        @customer.family_name = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名字を入力してください', '名字は全角で入力してください')
      end
      it '名字が全角以外で入力されていると登録できない' do
        @customer.family_name = 'aaa'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名字は全角で入力してください')
      end
      it '名前(フリガナ)が入力されていないと登録できない' do
        @customer.first_name_k = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名前(フリガナ)を入力してください', '名前(フリガナ)は全角カタカナで入力してください')
      end
      it '名前(フリガナ)が全角カタカナ以外で入力されていると登録できない' do
        @customer.first_name_k = 'あああ'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名前(フリガナ)は全角カタカナで入力してください')
      end
      it '名字(フリガナ)が入力されていないと登録できない' do
        @customer.family_name_k = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名字(フリガナ)を入力してください', '名字(フリガナ)は全角カタカナで入力してください')
      end
      it '名字(フリガナ)が全角カタカ以外で入力されていると登録できない' do
        @customer.family_name_k = 'あああ'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('名字(フリガナ)は全角カタカナで入力してください')
      end
      it '性別が選択されていないと登録できない' do
        @customer.gender = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('性別を選択してください')
      end
      it '生年月日が入力されていないと登録できない' do
        @customer.birthday = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('誕生日を入力してください')
      end
      it '郵便番号が入力されていないと登録できない' do
        @customer.postal_code = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('郵便番号を入力してください', '郵便番号はハイフン(-)を使用してください')
      end
      it '郵便番号にハイフンが含まれていないと登録できない' do
        @customer.postal_code = '1234567'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('郵便番号はハイフン(-)を使用してください')
      end
      it '都道府県を選択していないと登録できない' do
        @customer.prefecture_id = 1
        @customer.valid?
        expect(@customer.errors.full_messages).to include('都道府県を選択してください')
      end
      it '市区町村を入力していないと登録できない' do
        @customer.city = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('市区町村を入力してください')
      end
      it '住所を入力していないと登録できない' do
        @customer.address = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('住所を入力してください')
      end
      it '電話番号を入力していないと登録できない' do
        @customer.tel = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('電話番号を入力してください', '電話番号はハイフン(-)を使用せず数字のみ入力して下さい')
      end
      it '電話番号が11桁以上(ハイフンが含まれている状態)だと登録できない' do
        @customer.tel = '090-1234-5678'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('電話番号はハイフン(-)を使用せず数字のみ入力して下さい')
      end
      it '職業が選択されていないと登録できない' do
        @customer.job_id = 1
        @customer.valid?
        expect(@customer.errors.full_messages).to include('職業を選択してください')
      end
      it 'コースが選択されていないと登録できない' do
        @customer.course_id = 1
        @customer.valid?
        expect(@customer.errors.full_messages).to include('コースを選択してください')
      end
      it '身長が入力されていないと登録できない' do
        @customer.height = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('身長を入力してください', '身長は数値で入力してください')
      end
      it '身長が半角数字以外で入力されていると登録できない' do
        @customer.height = 'aaa'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('身長は半角数字のみ使用してください', '身長は数値で入力してください')
      end
      it '身長に220cm以上の値を入力すると登録できない' do
        @customer.height = 221
        @customer.valid?
        expect(@customer.errors.full_messages).to include('身長は220以下の値にしてください')
      end
      it '身長に100cm以下の値を入力すると登録できない' do
        @customer.height = 99
        @customer.valid?
        expect(@customer.errors.full_messages).to include('身長は100以上の値にしてください')
      end
      it '登録したユーザーが紐付けされていないと登録できない' do
        @customer.user = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
