require 'redis'
require 'base64'

module CableHelpers
  extend self

  def user_is_connected?(user_id)
    Redis.new.pubsub('channels', 'action_cable/*').any? do |subscription|
      gid = ::Base64.decode64(subscription.split('/').last)

      gid.split('/').last.to_i == user_id
    end
  end
end
