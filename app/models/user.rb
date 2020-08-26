class User < ApplicationRecord
  after_create :fake_job
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def fake_job
    FakeJob.perform_now
    FakeJob.perform_later
  end
end
