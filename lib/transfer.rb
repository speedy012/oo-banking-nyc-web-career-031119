class Transfer
  # your code here

attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status != "complete"
        if sender.valid? then sender.balance -= self.amount end
        if !sender.valid?
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
        else
          if receiver.valid? then receiver.balance += self.amount end
          self.status = "complete"
        end
      end
  end
    #self.execute_transaction ||=

  #self.execute_transaction = “Transaction rejected. Please check your account balance.”
  #self.status = “rejected

  def reverse_transfer
    if status == "complete"
      sender.balance += self.amount if sender.valid? 
      receiver.balance -= self.amount if receiver.valid?
      self.status = "reversed"
    end
  end

end
