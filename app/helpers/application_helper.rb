module ApplicationHelper

  def profile_img(user)
     return image_tag(user.avatar) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
      image_tag(img_url)
  end
end
