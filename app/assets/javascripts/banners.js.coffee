jQuery ->
  $('form').submit ->
				width = $('#banner_width').val()
  		height = $('#banner_height').val()

    $('.field_width').val(width)
    $('.field_height').val(height)
