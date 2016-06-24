class WeekdaysController < ApplicationController
  before_action :find_weekday, only: [:show, :destroy]

  def index
    @weekdays = Weekday.all
  end

  def new
    @weekday = Weekday.new
  end

  def create
    @weekday = Weekday.new(weekday_params)

    if @weekday.save
      redirect_to @weekday
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @weekday.destroy
    redirect_to root_path, notice: 'Successfully deleted weekday'
  end

  private

  def weekday_params
    params.require(:weekday).permit(:title, :cover)
  end

  def find_weekday
    @weekday = Weekday.find(params[:id])
  end
end
