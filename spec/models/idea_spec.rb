require 'rails_helper'

RSpec.describe Idea, type: :model do

  before{@idea = Idea.new}

  describe 'Testes de preenchimento do model Idea' do

    it 'name consegue ser preenchido?' do
      @idea.name = 'uso do cobol'
      expect(@idea.name).to eq('uso do cobol')
    end

  end

end