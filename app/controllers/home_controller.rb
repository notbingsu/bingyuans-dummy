class HomeController < ApplicationController
  def index
    @response = params[:response]
    # @response = "sample response"
  end
  def whatsup
    WhatsupJob.perform_at(5.seconds.from_now)
  end
  def checkName
    @name = params[:name]
    api_key = Rails.application.credentials.dig(:OPEN_AI, :my_key)
    llm = Langchain::LLM::OpenAI.new(api_key: api_key)
    llm_response = llm.chat(messages:[{
      role:"system",
      content: "You are a healthcare professional, you are chatting with a patient describing his symptom."
    },{
      role:"user",
      content: "I have #{params[:name]}, give me 3 concise steps I should take to manage it."
    }]).completion
    @response = llm_response
    redirect_to root_path(response: @response)
  end
end
