class SoundscapeWorker
  include Sidekiq::Worker

  def perform(*args)
    # For each place with available trends, create a Soundscape record that can be
    # used to query FreeSound etc and build up supporting assets (audio, images, etc).
    Soundscape.create_from_trends_available
  end
end
