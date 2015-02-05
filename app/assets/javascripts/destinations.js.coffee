$(document).ready ->
  $('a[data-target]').click (e) ->
    e.preventDefault()
    $this = $(this)
    if $this.data('target') == 'Add to'
      url = $this.data('addurl')
      new_target = "Remove from"
      $.ajax url: url, type: 'post', success: (data) ->
        $('.cart-count').html(data)
        $this.find('span').html(new_target)
        $this.data('target', new_target)
    else
      url = $this.data('removeurl')
      new_target = "Add to"
      $.ajax url: url, type: 'delete', success: (data) ->
        $('.cart-count').html(data)
        $this.find('span').html(new_target)
        $this.data('target', new_target)
