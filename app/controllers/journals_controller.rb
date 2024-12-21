class JournalsController < ApplicationController
  before_action :set_journal, only: [:destroy, :edit, :update, :show]
  
  def index
    @journals = Journal.all
  end
  def new
    @journal = Journal.new
  end

  def create
    Journal.create(journal_params)
    redirect_to '/'
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
    params.require(:journal).permit(:entry_date, :mood, :content).merge(user_id: current_user.id)
  end
end
