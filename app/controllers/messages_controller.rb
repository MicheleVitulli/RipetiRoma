# frozen_string_literal: true

class MessagesController < ApplicationController
  load_and_authorize_resource

  def create
    @messaged = User.find(params[:user_id])
    @message = @messaged.messages.create(message_params)
    if @message.save
      flash[:success] = 'Messaggio inviato'
      redirect_to user_path(@messaged)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:warning] = 'Messaggio eliminato'
    redirect_to request.referrer
  end

  def message_params
    p = params.require(:message).permit(:testo, :messanger)
    { testo: p[:testo], messanger: current_user }
  end
end
