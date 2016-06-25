class WeekdaysController < ApplicationController
  before_action :find_weekday, only: :show

  def index
    @weekdays = Weekday.all
  end

  def create
    @weekday = Weekday.new(weekday_params)

    if @weekday.save
      flash[:success] = 'Weekday was created.'
      redirect_to @weekday
    else
      flash[:error] = 'Weekday was not created.'
      redirect_to root_path
    end
  end

  def show
  end

  private

  def weekday_params
    params.require(:weekday).permit(:title, :cover)
  end

  def find_weekday
    @weekday = Weekday.find(params[:id])
  end
end
