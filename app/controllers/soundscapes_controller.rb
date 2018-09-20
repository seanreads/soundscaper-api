class SoundscapesController < ApplicationController

  def index
    @soundscapes = Soundscape.all
    render json: SoundscapeSerializer.new(@soundscapes).serializable_hash, status: :ok
  end

  def create
  end

end
