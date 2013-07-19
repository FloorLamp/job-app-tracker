require 'open-uri'
require 'json'

module MainHelper
  SEARCH_URL = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyANhVCa8zTOi_YQWZP6-dGzFm8wo54cTKs&cx=006817703012497938624:mt-doxe5eqc&q='
  # FAVICON_URL = 'http://g.etfv.co/'
  FAVICON_URL = 'http://www.google.com/s2/favicons?domain_url='
  
  def get_url(name)
    response = JSON.parse(open(SEARCH_URL + URI::encode(name)).read)
    response['items'][0]['link']
  end
  
  def get_favicon(url)
    FAVICON_URL + URI::encode(url)
  end
end
