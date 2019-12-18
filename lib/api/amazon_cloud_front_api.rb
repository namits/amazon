class AmazonCloudFrontApi

  def self.fetch_data
    result = fetch_data_from_amazon_cloud_front('/aws/AmazonCloudFront/current/index')
    result = JSON.parse(result.body)
  end

  private

  def self.fetch_data_from_amazon_cloud_front(url)
    begin
      conn = Faraday.new(url: 'https://pricing.us-east-1.amazonaws.com/offers/v1.0' + url + '.json')
      res = conn.get
    rescue Faraday::ConnectionFailed
      puts "Unable to connect with Amazon Cloud Front server."
    rescue Faraday::TimeoutError
      puts 'Request Timed Out.'
    end
  end

end