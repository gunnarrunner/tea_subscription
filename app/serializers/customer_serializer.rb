class CustomerSerializer
  def self.return_customer(customer)
    {
      "data":{
        type: 'customer',
        id: customer.id,
        details: {
          first_name: customer.first_name,
          last_name: customer.last_name,
          email: customer.email,
          address: customer.address,
          subscriptions: customer.subscriptions
                }
      }
    }
  end
end
