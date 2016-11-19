class PagesController < ApplicationController
  include Mondo

  def home
  end

  def dashboard
  end

  def retailers
  end

  def card

    redirect_to "https://auth.getmondo.co.uk/?client_id=oauthclient_00009EVlFZwDqu9nSSq0m1&redirect_uri=http://localhost:3000/oauth/callback&response_type=code&state=zopa123"

    mondo = Mondo::Client.new(
     token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaSI6Im9hdXRoY2xpZW50XzAwMDA5NFB2SU5ER3pUM2s2dHo4anAiLCJleHAiOjE0Nzk1NzgwNzAsImlhdCI6MTQ3OTU1NjQ3MCwianRpIjoidG9rXzAwMDA5RVZpSldvcjVmMVNVVkJybXIiLCJ1aSI6InVzZXJfMDAwMDk5T1RBcldyZEZNVEdxcElXSCIsInYiOiIyIn0.Dd2JIuA2T3sRaZkAgYjlBfjSUy7_p46Ozzufeu-HCwo',
     account_id: 'acc_000099OTXXE1HuEFLsT35d'
   )

   totalEligibile = 0
   eligibleTransactions = Array.new

   for transaction in mondo.transactions do
     if isEligibileTransaction transaction
       eligibleTransactions << transaction
     end
   end 

   @ping = eligibleTransactions
  end

end

def isEligibileTransaction(transaction)
   return transaction.category == "shopping" && transaction.merchant != nil
end
