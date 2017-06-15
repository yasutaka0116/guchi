class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def welcome_send(user)
    @user = user
    mail to: @user.email, subject: "登録完了しました"
  end

  def accept_send(accept)
    @user = User.find(accept.request.user_id)
    @request = Request.find(accept.request_id)
    @accept = Accept.find(accept.id)
    mail to: @user.email, subject: "[グチろう] リクエストを受けつけました！"
  end

  def decision_send(decision)
    @user = User.find(decision.user_id)
    @request = Request.find(decision.request_id)
    mail to: @user.email, subject: "[グチろう] リクエストが承認されました"
  end
end
