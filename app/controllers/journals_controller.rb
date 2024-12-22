class JournalsController < ApplicationController
  before_action :set_journal, only: [:destroy, :edit, :update, :show]
  
  def index
    @journals = Journal.all
  end
  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      # 成功時に感情選択ページにリダイレクト
      redirect_to new_mood_option_path(journal_id: @journal.id)
    else
      # 失敗時に再度入力画面を表示
      flash.now[:alert] = "投稿に失敗しました。もう一度お試しください。"
      render :new
    end
  end

  def destroy
    @journal.destroy
    redirect_to journals_path, notice: 'ジャーナルを削除しました。'
  end

  def edit
  end

  def update
    if @journal.update(journal_params)
      redirect_to @journal, notice: 'ジャーナルを更新しました。'
    else
      render :edit, alert: '更新に失敗しました。'
    end
  end

  def show
  end

  private
  def set_journal
    @journal = Journal.find(params[:id])
  end
  
  def journal_params
    params.require(:journal).permit(:entry_date, :content).merge(user_id: current_user.id)
  end
end
