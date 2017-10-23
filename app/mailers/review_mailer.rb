class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    
    mail(
      to: review.truck.user.email,
      subject: "New Review for #{review.truck.name}"
    )
  end
end
