class Admin::WorksController < ApplicationController
  before_action :if_not_signed_in
  before_action :if_not_admin
  before_action :set_work, only: [:edit, :update, :destroy]

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      redirect_to new_admin_work_path
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to works_path
    else
      redirect_to edit_admin_work_path
    end
  end

  def destroy
    @work = Work.find(params[:id])
    if @work.destroy
      redirect_to works_path
    else
      redirect_to edit_work_path(@work)
    end
  end

  private

  def if_not_signed_in
    redirect_to root_path unless user_signed_in?
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(:name, :category, {images: []}, :description, :softwear, :time, :date)
  end
end
