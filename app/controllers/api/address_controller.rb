class Api::AddressController < ApplicationController
  def show
    @address = ::Services::BrasilApi::Cep.new(cep: params[:cep]).result
    
    render json: @address
  end
end


