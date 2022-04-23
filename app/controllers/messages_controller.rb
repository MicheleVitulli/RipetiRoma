# frozen_string_literal: true

class MessagesController < ApplicationController
  load_and_authorize_resource

  def create
    @messaged = User.find(params[:user_id])
    @message = @messaged.messages.create(message_params)
    # redirect_to user_path(@recensito)
    # render :text => params[:review_params][:testo]
    redirect_to user_path(@messaged) if @message.save
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to request.referrer
  end

  def message_params
    p = params.require(:message).permit(:testo, :messanger)
    { testo: p[:testo], messanger: current_user }
  end
end
