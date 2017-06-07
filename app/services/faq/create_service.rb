module FaqModule
  class CreateService
    def initialize(params)
      # TODO: identify origin and set company
      @company = Company.last
      @question = params["question-original"]
      @answer = params["answer-original"]
      @faq_type = params["faq_type-original"]
      @hashtags = params["hashtags-original"]
    end

    def call
      if @hashtags == nil || @hashtags == ""
        return "Hashtag Obrigatória"
      end

      return "Tipo obrigatório" if @faq_type == nil

      begin
        Faq.transaction do
          faq = Faq.create(question: @question, answer: @answer, faq_type: @faq_type, company: @company)
          @hashtags.split(/[\s,]+/).each do |hashtag|
            faq.hashtags << Hashtag.create(name: hashtag)
          end
        end
        "Criado com sucesso"
      rescue
        "Problemas na criação"
      end
    end
  end
end
