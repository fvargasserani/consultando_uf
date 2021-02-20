class UfsController < ApplicationController
  def uf_request
    uf = Uf.find_by(date: params[:date])
    
    url = 'https://mindicador.cl/api/uf/'+params[:date]
    response = HTTParty.get(url)

    if response.body.nil? || response['serie'] == []
      render json: 'Value not found'
    else 
      if request.headers['X-CLIENT'].present? && response['serie'] != []
        Search.create(date_query: params[:date], name: request.headers['X-CLIENT'])
        render json: response['serie'][0]['valor']
      else
        render json: 'CLIENT pending'
      end  
    end
  end

  def count_request
    count = Search.where(name: params[:name]).count 
    render json: count
  end
end
