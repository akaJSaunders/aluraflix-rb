require 'rails_helper'

RSpec.describe Video, :type => :model do
    describe "Validations" do
        it { should validate_presence_of(:titulo) }
        it { should validate_presence_of(:descricao) }
        it { should validate_presence_of(:url) }
      end
end