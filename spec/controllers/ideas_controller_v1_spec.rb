require 'rails_helper'

RSpec.describe Api::V1::IdeasController, type: :controller do

  before{@idea = Idea.create(name: 'terminal', description: 'uso de terminais burros')}

  describe 'GET /api/v1/ideas' do
    it 'Consegue listar todos os ideas e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/ideas/id' do
    it 'Consegue listar um idea especifico e retornar status 200?' do
      get :show, params: {id: @idea.id}
      expect(response.body).to include_json(id: @idea.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/ideas' do
    it 'Consegue criar um idea e retornar status 201?' do
      post :create, params: {idea: {name: 'COBOL', description: 'Uso de linguagem madura'}}
      expect(response.body).to include_json(description: 'Uso de linguagem madura')
      expect(response).to have_http_status(201)
    end
  end

  describe 'PATCH /api/v1/ideas/id' do
    it 'Consegue atualizar um idea e retornar status 200?' do
      idea = Idea.last
      patch :update, params: {idea: {name: 'JCL', description: 'linguagem de controle de jobs'}, id: idea.id}
      expect(response.body).to include_json(name: 'JCL')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/ideas/id' do
    it 'Consegue excluir um idea e retornar status 204?' do
      idea = Idea.last
      delete :destroy, params: {id: idea.id}
      expect(Idea.all).not_to include(idea)
      expect(response).to have_http_status(204)
    end
  end

end