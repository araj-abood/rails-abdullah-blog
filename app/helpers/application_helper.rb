module ApplicationHelper
  def gravator_for(user, options = { size: 50 })

    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)

    size = options[:size]
    puts options
    puts size
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag gravatar_url, alt: user.username, class: "rounded mx-auto d-block"
  end
end
