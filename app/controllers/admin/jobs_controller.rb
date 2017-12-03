class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "admin"
  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
  end

  def new
    @jobs = Job.all
    #@jobs是为了admin.html.erb中的全部发布／隐藏 而传的参数。
    @job = Job.new
  end

  def create
    @jobs = Job.all
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path
      flash[:notice] = "新增了一个职缺"
    else
      flash[:alert] = "失败"
      render "new"
    end
  end

  def edit
    @jobs = Job.all
    @job = Job.find(params[:id])
  end

  def update
    @jobs = Job.all
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      flash[:alert] = "失败"
      render "edit"
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "删除成功"
    redirect_to admin_jobs_path
  end

  def publish
    @job = Job.find(params[:id])
    @job.publish!
    redirect_to :back
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!
    redirect_to :back
  end

  def publish_all
    @jobs = Job.where("is_hidden = ?", true)
    # @jobs = Job.all
    @jobs.each do |j|
      j.publish!
    end
    redirect_to :back
  end

  def hide_all
    # @jobs = Job.where("is_hidden = ?", false)
    @jobs = Job.all
    @jobs.each do |j|
      j.hide!
    end
    redirect_to admin_jobs_path
  end

private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end

end
