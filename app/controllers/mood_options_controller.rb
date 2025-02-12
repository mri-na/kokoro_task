class MoodOptionsController < ApplicationController
  before_action :set_target, only: [:new, :create]
  def new
    @mood_option = @target.build_mood_option
    @mood_colors = {
      "Positive" => { "満足" => "#FFD700", "感謝" => "#FFFF00", "嬉しい" => "#FFEC8B", "ワクワク" => "#FFEC8B",
                      "好き" => "#FFD700", "感心" => "#FFD700", "面白い" => "#FFD700", "楽しい" => "#FFD700" },
      "Fine" => { "スッキリ" => "#FFEC8B", "ドキドキ" => "#FFEC8B", "安心" => "#FFEC8B", "穏やか" => "#1E90FF",
                  "普通" => "#FFEC8B", "退屈" => "#FFEC8B", "モヤモヤ" => "#FFEC8B", "緊張" => "#1E90FF"},               
      "Negative" => { "不安" => "#6495ED", "悲しい" => "#4682B4", "疲れた" => "#1E90FF", "後悔" => "#FFEC8B",
                      "恐れる" => "#6495ED", "イライラ" => "#4682B4", "怒り" => "#1E90FF", "嫌い" => "#1E90FF"}
    }
    @mood_labels = {
      "Person" => ["自分", "友達", "家族", "ペット"],
      "Life" => ["仕事", "バイト", "勉強", "お金", "恋愛", "家事", "健康", "就職"],
      "Hobby" => ["食", "本", "音楽", "旅行", "美容", "ゲーム", "スポーツ", "お酒"],
      "Other" => ["学校", "交通機関", "その他"]
    }
  end
  
  def create
    @mood_option = @target.build_mood_option(
      colors: params.dig(:mood_option, :colors), # 選択された色を取得
      labels: params.dig(:mood_option, :labels) # 選択されたラベルを取得
    )
    if @mood_option.save
      redirect_to @target, notice: "感情の選択が保存されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_target
    if params[:journal_id]
      @target = Journal.find(params[:journal_id])
    elsif params[:task_id]
      @target = Task.find(params[:task_id])
    else
      flash[:alert] = "No valid target found for MoodOption"
      redirect_to tasks_path and return # 適切なリダイレクト先に変更
    end
  end
  # mood_option_paramsが正常に送れないため、params.digで行う
  def mood_option_params
    params.require(:mood_option).permit(colors: [], labels: [])
  end
end