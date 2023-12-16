require 'rails_helper'

RSpec.describe Idea, type: :model do

  before{@idea = Idea.new}

  describe 'Testes de preenchimento do model Idea' do

    it 'name consegue ser preenchido?' do
      @idea.name = 'uso do cobol'
      expect(@idea.name).to eq('uso do cobol')
    end

    it 'description consegue ser preenchido?' do
      @idea.description = 'manter a estrutura consagrada'
      expect(@idea.description).to eq('manter a estrutura consagrada')
    end

  end

  describe 'Testes de validacao do model Idea' do

    it 'idea valido com campos obrigatorios preenchidos?' do
      @idea.name = 'JCL'
      @idea.description = 'linguagem para controlar jobs'
      expect(@idea).to be_valid
    end

  end

end