class SubscriptionSerializer
  def self.return_subscription(subscription)
    {
      "data":{
        type: 'subscription',
        id: subscription.id,
        details: {
          title: subscription.title,
          price: subscription.price,
          status: subscription.status,
          frequency: subscription.frequency,
          customer_id: subscription.customer_id,
          tea_id: subscription.tea_id
                }
      }
    }
  end
end