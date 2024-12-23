class DashboardController < ApplicationController
  def index
    @journals = current_user.journals.order(entry_date: :desc)
    @tasks = current_user.tasks.order(due_date: :asc)
  end
end
