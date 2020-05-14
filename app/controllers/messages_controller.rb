class MessagesController < ApplicationController
  def index
    messages = []
    messages << "Hello"
    render json: { messages: messages }.to_json, status: :ok
  end
end
