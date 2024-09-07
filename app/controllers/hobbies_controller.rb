class HobbiesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create] #投稿機能はログインユーザーのみ実行できる
  
  

  def index #一覧ページに必要なindexアクション
    @hobbies=Hobby.all 
  end

  def new 
    @hobby=Hobby.new
  end

  def create
    hobby=Hobby.new(hobby_params) #params：ユーザーから送信された情報を受け取る変数
    hobby.user_id=current_user.id #current_user：現在ログインしているuserの情報（レコード）をとってくる機能を実行,[変数.カラム名]

    if hobby.save
      redirect_to :action=>"index" #あるアクションから他のアクションを実行する
    else
      redirect_to :action=>"new"
    end
  end

  

  private
  def hobby_params #hobby_paramsメソッドは、趣味投稿に関するもの以外の情報を含むparamsから、ツイート情報のハッシュだけを絞り込むメソッド
    params.require(:hobby).permit(:body) #user_idのような勝手に変えられてはいけない情報は、permitというメソッドを使って受け取る情報を限定する
  end
end
