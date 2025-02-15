class MoodOptionsController < ApplicationController
  before_action :set_target, only: [:new, :create]
  def new
    @mood_option = @target.build_mood_option
    @mood_colors = {
      "Positive" => { "満足" => "#FF4500", "感謝" => "#FF5722", "嬉しい" => "#FF6F00", "ワクワク" => "#FFA000",
                      "好き" => "#FFB300", "感心" => "#FFC107", "面白い" => "#FFD54F", "楽しい" => "#FFE082" },
      "Fine" => { "スッキリ" => "#D4E157", "ドキドキ" => "#C0CA33", "安心" => "#8BC34A", "穏やか" => "#7CB342",
                  "普通" => "#4CAF50", "退屈" => "#389D49", "モヤモヤ" => "#1F8651", "緊張" => "#00695C"},               
      "Negative" => { "不安" => "#00838F", "悲しい" => "#007A9D", "疲れた" => "#016FAE", "後悔" => "#0277BD",
                      "恐れる" => "#026AAE", "イライラ" => "#01639F", "怒り" => "#01579B", "嫌い" => "#283593"}
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