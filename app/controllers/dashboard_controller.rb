class DashboardController < ApplicationController
  before_action :set_journal, only: [:destroy, :edit, :update, :show]
  def index
    @grouped_entries = {}

    # JournalとTaskをまとめる
    current_user.journals.each do |journal|
      date = journal.entry_date
      @grouped_entries[date] ||= { journals: [], tasks: [] }
      @grouped_entries[date][:journals] << journal
    end

    current_user.tasks.each do |task|
      date = task.due_date
      @grouped_entries[date] ||= { journals: [], tasks: [] }
      @grouped_entries[date][:tasks] << task
    end

    # 日付順に並び替え
      @grouped_entries = @grouped_entries.sort.to_h

    # 記念日を取得
    today = Date.today
    @today_info = fetch_today_info(today)
  end

private

  def fetch_today_info(date)
    url = "https://ja.wikipedia.org/api/rest_v1/page/summary/#{date.strftime('%m月%d日')}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    data["extract"] # Wikipediaの概要を取得
  rescue StandardError
    "今日は何の日かを取得できませんでした。"
  end
end