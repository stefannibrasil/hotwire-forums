class NewPostNotification < Noticed::Base
  deliver_by :database

  param :post

  def message
    "New post in #{params[:post].discussion.name}"
  end
  
  def url
    discussion_path(params[:post].discussion)
  end
end
