require 'pry'

class Transfer
	attr_reader :sender,  :receiver
	attr_accessor :status, :amount

	def initialize(sender,receiver,amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
		# binding.pry
		
	end

	def valid?
   		 @sender.valid? && @receiver.valid? && @sender.balance > @amount
	end

	def execute_transaction
		if self.valid? && @status == "pending"
		@sender.balance -= @amount
		@receiver.balance += @amount
		# @sender.close_account
		# @receiver.close_account
		@status = "complete"
		else
		@status = "rejected"
		"Transaction rejected. Please check your account balance."
		# binding.pry
	  end
	end

	def reverse_transfer
		if @status == "complete"
			@sender.balance += @amount
			@receiver.balance -= @amount
			@status = "reversed"
		end
	end



  
end
