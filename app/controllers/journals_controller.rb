class JournalsController < ApplicationController
  before_action :set_journal, only: [:destroy, :edit, :update, :show]
  
  def index
    @journals = Journal.includes(:mood_option)
  end
  def new
    @journal = Journal.new
  end

  def create
    @journal = current_user.journals.build(journal_params)
    if @journal.save
      # ジャーナル作成後、ポリモーフィック関連で MoodOption の new アクションにリダイレクト
      redirect_to new_journal_mood_option_path(@journal)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @journal.destroy
      redirect_to root_path
    else
      redirect_to journals_url, status: :unprocessable_entity, notice: 'ジャーナルが削除されました。'
    end
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    if @journal.update(journal_params)
      redirect_to @journal, notice: 'ジャーナルを更新しました。'
    else
      render :edit, alert: '更新に失敗しました。'
    end
  end

  def show
    @journal = Journal.find(params[:id])
    # @mood_option = @journal.mood_option
  end

  private
  def set_journal
    @journal = Journal.find(params[:id])
  end
  
  def journal_params
    params.require(:journal).permit(:entry_date, :content).merge(user_id: current_user.id)
  end
end
