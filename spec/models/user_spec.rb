require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'nickname,email,passwword,password_confirmation,last_name_kanji,first_name_kanji,last_name_kana ,first_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'test@test.com'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
      end
      it 'passwordが半角英数字の場合登録できる' do
        @user.password = 'aaa111'
      end
      it 'passwordが一致していれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
      end
      it 'last_name_kanjiが漢字・平仮名・カタカナであれば登録できる' do
        @user.last_name_kanji = '亜あア'
        expect(@user).to be_valid
      end
      it 'first_name_kanjiが漢字・平仮名・カタカナであれば登録できる' do
        @user.first_name_kanji = '亜あア'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カタカナであれば登録できる' do
        @user.last_name_kana = 'アイウエオ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カタカナでれば登録できる' do
        @user.first_name_kana = 'アイウエオ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていない場合、登録できない' do
        @user.email = 'test.com'
        @user.valid?
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
      end
      it 'passrordが全角では登録できない' do
        @user.password = '１１１１１１'
        @user.password_confirmation = '１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが一致していないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_name_kanjiが空では登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it 'first_name_kanjiが空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanjiが漢字・平仮名・カタカナ以外では登録できない' do
        @user.last_name_kanji = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji is invalid')
      end
      it 'first_name_kanjiが漢字・平仮名・カタカナ以外では登録できない' do
        @user.first_name_kanji = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid')
      end
      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kanji = '111aaaあああ亜嗚呼'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji is invalid')
      end
      it 'first_name_kanaが全角カタカナ以外では登録できない' do
        @user.first_name_kanji = '111aaaあああ亜嗚呼'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
