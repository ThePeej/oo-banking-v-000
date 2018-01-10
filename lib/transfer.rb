require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount, :valid?

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance - @amount >= 0 ? true: false
  end

  def execute_transaction
    binding.pry
    if @sender.valid? && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
      binding.pry
    else
      binding.pry
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

  end
end
