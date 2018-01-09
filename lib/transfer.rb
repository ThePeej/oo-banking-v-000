require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true: false
  end

  def execute_transaction
    checker = true
    if @sender.valid? && checker
      @sender.balance -= @amount
      @receiver.balance += @amount
      @sender.status = "complete"
      @receiver.status = "complete"
      checker = false
      # binding.pry
    else
      checker = false
      "REJECTED"
    end
  end

  def reverse_transfer

  end
end
