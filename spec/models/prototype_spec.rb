require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end
  describe '新規投稿登録' do
    context '投稿ができる場合' do
      it "image,title,catch_copy,conceptが存在すれば登録できる" do
        expect(@prototype).to be_valid
      end
    end  
    context '投稿ができない場合' do
      it "写真が添付されていないと登録できない" do
        @prototype.image = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Image can't be blank")
      end
      it "タイトルが入力されていなければ登録できない" do
        @prototype.title = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Title can't be blank")
      end
      it "場所が入力されていなければ登録できない" do
        @prototype.catch_copy = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Catch copy can't be blank")
      end
      it "投稿の説明が入力されていなければ登録できない" do
        @prototype.concept = ''
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Concept can't be blank")
      end
      it "userが紐付いていない場合は登録できない" do
        @prototype.user = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("User must exist")
      end
    end
  end
end