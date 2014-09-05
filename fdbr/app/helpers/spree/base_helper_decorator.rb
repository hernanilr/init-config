Spree::BaseHelper.module_eval do
  def logo(image=Spree::Config[:logo])
    if Rails.env == "development"
      image_tag(image[0..-4] + "jpg", class: "img-responsive")
    else
      content_tag("object", image_tag(image[0..-4] + "jpg", class: "img-responsive"), data: image_path(image + "z"), type: "image/svg+xml", class: "img-responsive")
    end
  end
  def body_class
    @body_class ||= content_for?(:sidebar) ? '' : ''
    @body_class
  end
end
