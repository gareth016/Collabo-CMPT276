module ApplicationHelper
    def grav_pic(user)
        id = Digest::MD5::hexdigest(user.email.downcase)
        url = "https://secure.gravatar.com/avatar/" + id + "?s=150"
        image_tag(url, alt: user.username, class: "img-circle")
    end
end
