class MoodOptionsController < ApplicationController

  def new
    @journal = Journal.find(params[:journal_id])
    @mood_option = MoodOption.new
    @mood_labels = MoodOption::MOOD_LABELS
    @mood_colors = MoodOption::MOOD_COLORS
  end

  def create
    @mood_option = MoodOption.new(mood_option_params)
    if @mood_option.save
      redirect_to journal_path(@mood_option.journal), notice: "感情を登録しました。"
    else
      flash.now[:alert] = "感情の登録に失敗しました。"
      render :new
    end
  end

  private

  def mood_option_params
    params.require(:mood_option).permit(:labels, :colors).merge(journal_id: params[:journal_id])
  end
end
