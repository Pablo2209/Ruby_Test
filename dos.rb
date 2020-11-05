
require 'net/http'
require 'json'

    def request(address, api_key)
        url = URI(address+"&api_key="+api_key)
        http = Net::HTTP.new(url.host, url.port)

        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)

        response = http.request(request)
        JSON.parse response.read_body
    end
    
    body = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY", "2y4Kfc1QTMpM5TYq4VkPn0Fd652aJpbp516DxTDD")
    body = body["photos"][0..5]                     


    def build_web_page(body)
        html = "<html>\n<title>API Nasa</title>\n<head>\n</head>\n<body>\n<h1>API Nasa<h1>\n<ul>\n"
        body.collect {|img|html += "\t<li><img src=\"#{img["img_src"]}\"></li>\n"}    
        html += "</ul>\n</body>\n</html>"
        File.write('Ruby_API_NASA3.html', html)
    end

    build_web_page(body)
    puts "Pagina WEB creada"
