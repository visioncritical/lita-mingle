require 'spec_helper'

describe Lita::Handlers::Mingle, lita_handler: true do
  it { is_expected.to route('Mingle project').to(:list_projects) }
  it { is_expected.to route('Mingle Project').to(:list_projects) }
  it { is_expected.to route('Mingle projects').to(:list_projects) }
  it { is_expected.to route('Mingle Projects').to(:list_projects) }

  it { is_expected.to route('mingle project').to(:list_projects) }
  it { is_expected.to route('mingle Project').to(:list_projects) }
  it { is_expected.to route('mingle projects').to(:list_projects) }
  it { is_expected.to route('mingle Projects').to(:list_projects) }

  it { is_expected.to route('mingle project card_type with name Guenter').to(:create_card) }
  it { is_expected.to route('Mingle project card_type with name Guenter').to(:create_card) }

  it { is_expected.to route('mingle project 1 Electronium Hat').to(:update_card) }
  it { is_expected.to route('Mingle project 1 Electronium Hat').to(:update_card) }

  before do
    allow_any_instance_of(MingleAPI).to receive(:projects).and_return(response)
    allow_any_instance_of(MingleAPI).to receive(:create_card).and_return(response)
    allow_any_instance_of(MingleAPI).to receive(:card).and_return(response)
    allow_any_instance_of(MingleHelpers::API::Client).to receive(:update_card).and_return(update_card_response)
  end

  let(:response) { double('MingleHelpers::API::Client') }
  let(:projects_response) do
    [OpenStruct.new(name: 'Mars University Expirement',
                    identifier: 'marsu',
                    description: 'See if a monkey could pass a course at Mars University')
    ]
  end
  let(:create_card_response) do
    'https://your.mingle.server/projects/marsu/cards/1'
  end
  let(:card_response) do
    {
      name: 'Mars University Expirement',
      identifier: 'marsu',
      description: 'See if a monkey could pass a course at Mars University'
    }
  end
  let(:update_card_response) do
    'https://your.mingle.server/projects/marsu/cards/1'
  end

  describe 'listing projects' do
    it 'should be successful' do
      allow(response).to receive(:collect).and_return(projects_response)

      send_command('mingle projects')
      expect(replies.last).to eq("PROJECT ID -- NAME\nmarsu -- Mars University Expirement\n")
    end
  end

  describe 'creating a card' do
    it 'should be successful' do
      allow(response).to receive(:url).and_return(create_card_response)

      send_command('mingle project Epic with name Guenter')
      expect(replies.last).to eq('Card created - https://your.mingle.server/projects/marsu/cards/1')
    end
  end

  describe 'updating a card' do
    it 'should be successful' do
      allow(response).to receive(:to_h).and_return(card_response)
      allow(response).to receive(:url).and_return(update_card_response)

      send_command('mingle project 1 Electronium Hat')
      expect(replies.last).to eq('Card updated - https://your.mingle.server/projects/marsu/cards/1')
    end
  end
end
