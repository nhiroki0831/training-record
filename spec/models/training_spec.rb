require 'rails_helper'
describe Training do
  before do
    @training = FactoryBot.build(:training)
  end

  describe 'トレーニング記録機能' do
    context 'トレーニング記録成功' do
      it '必要な項目を全て入力していると記録できる' do
        expect(@training).to be_valid
      end
      it '備考欄が入力されていなくても記録ができる' do
        @training.remarks = nil
        expect(@training).to be_valid
      end
      it 'トレーニングメニューのチェックが複数あっても記録ができる' do
        @training.part = %w[胸 肩 脚]
        expect(@training).to be_valid
      end
    end
    context 'トレーニング記録失敗' do
      it '体重が入力されていないと記録ができない' do
        @training.weight = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('体重を入力してください', '体重は半角数字のみ使用してください', '体重は数値で入力してください')
      end
      it '体重が半角数字以外で入力されると記録ができない' do
        @training.weight = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include('体重は半角数字のみ使用してください', '体重は数値で入力してください')
      end
      it '体重が250kg以上の値だと記録ができない' do
        @training.weight = '250.1'
        @training.valid?
        expect(@training.errors.full_messages).to include('体重は250以下の値にしてください')
      end
      it '体脂肪が入力されていないと記録ができない' do
        @training.body_fat = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('体脂肪を入力してください', '体脂肪は半角数字のみ使用してください', '体脂肪は数値で入力してください')
      end
      it '体脂肪が半角数字以外で入力されると記録ができない' do
        @training.body_fat = '１１'
        @training.valid?
        expect(@training.errors.full_messages).to include('体脂肪は半角数字のみ使用してください', '体脂肪は数値で入力してください')
      end
      it '体脂肪が90%以上の値だと記録ができない' do
        @training.body_fat = '90.1'
        @training.valid?
        expect(@training.errors.full_messages).to include('体脂肪は90以下の値にしてください')
      end
      it '最高血圧が入力されていないと記録ができない' do
        @training.blood_pressure_max = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('最高血圧を入力してください', '最高血圧は半角数字のみ使用してください', '最高血圧は数値で入力してください')
      end
      it '最高血圧が半角数字以外で入力されていると記録できない' do
        @training.blood_pressure_max = '１２３'
        @training.valid?
        expect(@training.errors.full_messages).to include('最高血圧は半角数字のみ使用してください', '最高血圧は数値で入力してください')
      end
      it '最高血圧が260mmHg以上だと記録できない' do
        @training.blood_pressure_max = '261'
        @training.valid?
        expect(@training.errors.full_messages).to include('最高血圧は260以下の値にしてください')
      end
      it '最低血圧が60mmHg以下だと記録ができない' do
        @training.blood_pressure_max = '59'
        @training.valid?
        expect(@training.errors.full_messages).to include('最高血圧は60以上の値にしてください')
      end
      it '最低血圧が入力されていないと記録ができない' do
        @training.blood_pressure_min = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('最低血圧を入力してください', '最低血圧は半角数字のみ使用してください', '最低血圧は数値で入力してください')
      end
      it '最低血圧が半角数字以外で入力されると記録ができない' do
        @training.blood_pressure_min = 'aaa'
        @training.valid?
        expect(@training.errors.full_messages).to include('最低血圧は半角数字のみ使用してください', '最低血圧は数値で入力してください')
      end
      it '最低血圧が215mmHg以上だと記録ができない' do
        @training.blood_pressure_min = '216'
        @training.valid?
        expect(@training.errors.full_messages).to include('最低血圧は215以下の値にしてください')
      end
      it '最低血圧が40mmHg以下だと記録ができない' do
        @training.blood_pressure_min = '39'
        @training.valid?
        expect(@training.errors.full_messages).to include('最低血圧は40以上の値にしてください')
      end
      it '脈拍が入力されていないと記録ができない' do
        @training.pulse = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('脈拍を入力してください', '脈拍は半角数字のみ使用してください', '脈拍は数値で入力してください')
      end
      it '脈拍が半角数字以外で入力されていると登録ができない' do
        @training.pulse = '９０'
        @training.valid?
        expect(@training.errors.full_messages).to include('脈拍は半角数字のみ使用してください', '脈拍は数値で入力してください')
      end
      it '脈拍が180bpm以上だと記録ができない' do
        @training.pulse = '181'
        @training.valid?
        expect(@training.errors.full_messages).to include('脈拍は180以下の値にしてください')
      end
      it '脈拍が40bpm以下だと記録ができない' do
        @training.pulse = '39'
        @training.valid?
        expect(@training.errors.full_messages).to include('脈拍は40以上の値にしてください')
      end
      it 'トレーニングメニュのチェックがないと記録できない' do
        @training.part = nil
        @training.valid?
        expect(@training.errors.full_messages).to include('トレーニングメニューは必ず１つ選択して下さい')
      end
    end
  end
end
