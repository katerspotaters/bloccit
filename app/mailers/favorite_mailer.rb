class FavoriteMailer < ApplicationMailer
  default from: "katelyn.hertel19@gmail.com"

  def new_comment(user, post, comment)


    headers["Message-ID"] = "<comments/#{comment.id}@frozen-reaches-64832.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@frozen-reaches-64832.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@frozen-reaches-64832.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment


    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
