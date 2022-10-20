require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = create(:user)
    prototype = create(:prototype)
    @comment = build(:comment, user_id: user.id, prototype_id: prototype.id)
    sleep 0.2
  end
  describe 'コメント機能' do
    context 'コメントを保存できる場合' do
      it "コメントが入力済みであれば保存できる" do
        expect(@comment).to be_valid
      end
    end  
    context 'コメントを保存できない場合' do
      it "コメントが空では投稿できない" do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
      it "ユーザーがログインしていなければコメントできない" do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("ユーザーを入力してください")
      end
      it "投稿したものがなければコメントできない" do
        @comment.prototype_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("投稿を入力してください")
      end
    end
  end
end


