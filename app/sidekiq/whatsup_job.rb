class WhatsupJob
  include Sidekiq::Job
  def perform(*args)
    # Do something
    # count += 1
    puts "Whatsup"
  end
end
