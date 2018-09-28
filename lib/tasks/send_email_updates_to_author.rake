require 'rake'

task :send_email_updates_to_author => :environment do
  Rails.logger.info("How many inqueries: #{Inquiry.where("created_at <= ?", Time.zone.now.beginning_of_day).count}")
end
