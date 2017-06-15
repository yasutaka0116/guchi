class Accept < ApplicationRecord
  belongs_to :request
  belongs_to :user

  # scope :flaged, -. { where("")}
   after_create :accept_send
   def accept_send
     UserMailer.accept_send(self).deliver
   end
   after_update :decision_send
   def decision_send
    UserMailer.decision_send(self).deliver
   end
end
