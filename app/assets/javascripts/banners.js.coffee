jQuery -> 
 $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('div.field').hide()
    now_image_items   = $('input:file:visible').length
    max_banner_image  = $('#max_banner_image').val()
    if(now_image_items < max_banner_image)
      $('.add_fields').css('display', 'block')
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    now_image_items   = $('input:file:visible').length
    max_banner_image  = $('#max_banner_image').val()
    if(now_image_items >= max_banner_image)
      $(this).hide()
    event.preventDefault()

	$('form').ready ->
	  $('div.banner_custom').hide()
	
  $('#banner_category').change ->
    if $(':selected',this).val() != "P1" then $('div.banner_custom').hide() else $('div.banner_custom').show()