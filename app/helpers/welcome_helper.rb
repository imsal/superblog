module WelcomeHelper


  def display_subscription_message(index)

    messages =
    [
      "Subscribe For Future Updates",
      "Get Gold Delivered To Your Inbox",
      "Subscriptions for the Modern World",
      "Subscribe, Just Do it!"
    ]

    return messages[index % messages.size]

  end


end
