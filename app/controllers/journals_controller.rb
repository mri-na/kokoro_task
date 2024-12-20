class JournalsController < ApplicationController
  def index
    @journals = Journal.all
  end
  def new
    @journal = Journal.new
  end
end
