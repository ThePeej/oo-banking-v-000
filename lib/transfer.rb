class Transfer
  attr_reader :sender, :receiver, :status, :amount

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
    if @sender.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
    else
      "REJECTED"
    end
  end

  def reverse_transfer

  end
end
