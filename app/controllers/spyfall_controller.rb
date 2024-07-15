class SpyfallController < ApplicationController
  before_action :create_game, only: [:index, :start_game, :make_guess, :quit_game]

  INSTRUCTIONS = "SPYFALLIO, your task is to guess my occupation. You may enter yes/no questions to guess my occupation."

  def index
    Rails.logger.info(@game.occupation)
    Rails.logger.info(@game.in_game)
    Rails.logger.info(Game.count)
    @in_game = @game.in_game
    @message = params[:message]
    if @message.nil?
      @message = INSTRUCTIONS
    end
  end

  def start_game
    @game.in_game = true
    @game.save
    redirect_to spyfall_index_path(message: "Enter your questions here")
  end

  def quit_game
    @game.delete_game
    redirect_to spyfall_index_path
  end

  def make_guess
    @game.add_to_log(params[:guess])
    if @game.validate_guess(params[:guess])
      @message = "CONGRATULATIONS, I AM A #{@game.occupation}!"
      @game.delete_game
      redirect_to spyfall_index_path(message: "CONGRATULATIONS, I AM A #{@game.occupation.upcase}!")
    else
      @response = guess_query(params[:guess])
      @game.add_to_log(@response)
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
    @game = Game.first_or_create(in_game: false)
  end
end
