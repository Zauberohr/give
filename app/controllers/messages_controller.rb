class MessagesController < ApplicationController

  def create
    @request = Request.find(params[:request_id])
    @message = Message.new(message_params)
    @message.request = @request
    @message.user = current_user
    @role = :taker

    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "messages/message", locals: { message: @message, user: current_user })
        end
        format.html { redirect_to request_path(@request) }
      end
    else
      render "requests/show", status: :unprocessable_entity
    end

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
