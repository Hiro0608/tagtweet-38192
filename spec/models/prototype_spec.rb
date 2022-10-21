require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end
  describe '新規投稿登録' do
    context '投稿ができる場合' do
      it "image,title,place,conceptが存在すれば登録できる" do
        expect(@prototype).to be_valid
      end
    end  
    context '投稿ができない場合' do
      it "写真が添付されていないと登録できない" do
        @prototype.image = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("画像を入力してください")
      end
      it "タイトルが入力されていなければ登録できない" do
        @prototype.title = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("タイトルを入力してください")
      end
      it "場所が入力されていなければ登録できない" do
        @prototype.place = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Catch copyを入力してください")
      end
      it "投稿の説明が入力されていなければ登録できない" do
        @prototype.concept = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Conceptを入力してください")
      end
      it "userが紐付いていない場合は登録できない" do
        @prototype.user = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end
end