module Admin::JobsHelper
  def render_job_status(job)
     if job.is_hidden
      content_tag(:i,"",class:"fa fa-lock fa-lg fa-spin fa-fw")
     else
      content_tag(:span,"",class:"fa fa-camera-retro fa-lg fa-fw")
     end
  end
end
