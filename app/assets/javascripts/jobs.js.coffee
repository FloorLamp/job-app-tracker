$(document).on('ready page:load', () ->
  company_name_input = $('#job_company_attributes_name')
  company_url_input = $('#job_company_attributes_website_url')
  company_icon_url_input = $('#job_company_attributes_icon_url')
  company_favicon_img = $('.favicon')
  
  
  company_name_input_timeout = null
  company_url_input_timeout = null
  FAVICON_URL = 'http://www.google.com/s2/favicons?domain_url='

  
  company_name_input.on('input', () ->
    clearTimeout(company_name_input_timeout)
    company_name_input_timeout = setTimeout(() ->
      $.getJSON('/company_url.json?name=' + company_name_input.val(), (data) -> 
        company_url_input.val(data.url)
        company_icon_url_input.val(FAVICON_URL + data.url)
        company_favicon_img.attr('src', FAVICON_URL + data.url)
      )
    , 500)
  )
  
  company_url_input.on('input', () ->
    clearTimeout(company_url_input_timeout)
    company_url_input_timeout = setTimeout(() ->
        company_icon_url_input.val(FAVICON_URL + company_url_input.val())
        company_favicon_img.attr('src', FAVICON_URL + company_url_input.val())
    , 500)
  )
)