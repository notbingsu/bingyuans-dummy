class SpyfallController < ApplicationController
  before_action :create_game, only: [:index, :start_game, :make_guess]
  def index
    @in_game = @game.in_game
    @message = params[:message]
  end

  def start_game
    @game.in_game = true
    @game.save
    redirect_to spyfall_index_path
  end

  def quit_game
    Game.destroy_all
    redirect_to spyfall_index_path
  end

  def make_guess
    if @game.validate_guess(params[:guess])
      @message = "CONGRATULATIONS, I AM A #{@game.occupation}!"
      Game.destroy_all
      redirect_to spyfall_index_path(message: "CONGRATULATIONS, I AM A #{@game.occupation.upcase}!")
    else
      @response = guess_query(params[:guess])
      redirect_to spyfall_index_path(message: "#{@response}")
    end
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def guess_query(phrase)
    api_key = Rails.application.credentials.dig(:OPEN_AI, :my_key)
    llm = Langchain::LLM::OpenAI.new(api_key: api_key)
    llm_response = llm.chat(messages:[{
      role:"system",
      content: "You are a #{@game.occupation}. You are to answer the following questions about your occupation without revealing your occupation. Respond with yes or no, provide details of no more than 15 words."
    },{
      role:"user",
      content: "#{phrase}"
    }]).completion
    @response = llm_response
    return @response
  end

  def create_game
    @game = Game.first_or_create(in_game: false, occupation: "doctor")
  end
end
