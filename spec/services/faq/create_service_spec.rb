require_relative './../../spec_helper.rb'

describe FaqModule::CreateService do
  before do
    @company = create(:company)

    @question = FFaker::Lorem.sentence
    @answer = FFaker::Lorem.sentence
    @faq_type = Faq.faq_types.keys.sample
    @hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
  end

  describe '#call' do
    it "Without hashtag params, will receive a error" do
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "faq_type-original" => @faq_type})

      response = @createService.call()
      expect(response).to match("Hashtag Obrigatória")
    end

    it "Cannot be valid without a type" do
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "faq_type-original" => nil, "hashtags-original" => @hashtags})

      response = @createService.call()
      expect(response).to match("Tipo obrigatório")
    end

    it "With valid params, receive success message" do
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "faq_type-original" => @faq_type, "hashtags-original" => @hashtags})

      response = @createService.call()
      expect(response).to match("Criado com sucesso")
    end

    it "With valid params, find question and anwser in database" do
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "faq_type-original" => @faq_type, "hashtags-original" => @hashtags})

      response = @createService.call()
      expect(Faq.last.question).to eq(@question)
      expect(Faq.last.answer).to eq(@answer)
    end

    it "With valid params, hashtags are created" do
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "faq_type-original" => @faq_type, "hashtags-original" => @hashtags})

      response = @createService.call()
      expect(@hashtags.split(/[\s,]+/).first).to eq(Hashtag.first.name)
      expect(@hashtags.split(/[\s,]+/).last).to eq(Hashtag.last.name)
    end
  end
end
