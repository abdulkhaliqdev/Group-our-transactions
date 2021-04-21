module ApplicationHelper
  def display_error_and_success
    if alert.present?
      "<div class='notification is-danger global-notification m-0 p-0 has-text-centered'>
        <p class='alert'> #{alert}</p>
      </div>".html_safe
    elsif notice.present?
      "<div class='notification is-primary global-notification m-0 p-0 has-text-centered'>
        <p class='notice'> #{notice}</p>
      </div>".html_safe
    end
  end
end
