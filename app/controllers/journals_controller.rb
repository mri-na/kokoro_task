class JournalsController < ApplicationController
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
    @journal = Journal.find(params[:id])
    @journal.destroy
    redirect_to journals_path, notice: 'ジャーナルを削除しました。'
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])
    if @journal.update(journal_params)
      redirect_to @journal, notice: 'ジャーナルを更新しました。'
    else
      render :edit, alert: '更新に失敗しました。'
    end
  end

  def show
    @journal = Journal.find(params[:id])
  end

  private
  def journal_params
    params.require(:journal).permit(:entry_date, :mood, :content).merge(user_id: current_user.id)
  end
end
