require 'net/http'

module Services
  module BrasilApi
    class Cep
      def initialize(cep: nil)
        @cep = cep.to_i
      end

      def result 
        url = URI.parse("https://brasilapi.com.br/api/cep/v1/#{@cep}") 
    
        response = Net::HTTP.get_response(url)

        if response.code.to_s == "200"
          return JSON.parse(response.body) 
        else
          {"body": "CEP não encontrado", "status": "404" }  
        end
      end
    end
  end
end