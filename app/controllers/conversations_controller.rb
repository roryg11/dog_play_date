class ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      render conversations_path
    else
      render :new
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  private
  def conversation_params
    params.require(:conversation).permit(:sender_id, :recipient_id)
  end

  def interlocutor(conversation)
    if current_user == conversation.recipient
      conversation.sender
    else
      conversation.recipient
    end
  end
end
