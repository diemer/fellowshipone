module Fellowshipone
  class Contribution

    def self.format(res)
      response = res["contributionReceipt"]
      if response.is_a?(Array)
        response.map{|contribution| format_contribution(contribution) }
      else
        format_response(response)
      end
    end

    def self.format_contribution(contribution)
      OpenStruct.new(
        id:       contribution["@id"],
        amount:   contribution["amount"],
        fund:     contribution["fund"]["name"],
        sub_fund: contribution["subFund"]["name"],
        person: contribution["person"]["@id"],
        household: contribution["household"]["@id"],
        contribution_type: contribution["contributionType"]["name"],
        created_at:     contribution["createdDate"],
        updated_at:     contribution["lastUpdatedDate"],
        date:     contribution["receivedDate"]
      )
    end

    def self.format_response(response)
      []
    end
  end
end
