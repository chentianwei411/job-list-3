module Admin::JobsHelper
  def render_job_status(job)
     if job.is_hidden
      "未发布"
     else
      "已发布"
     end
  end
end
