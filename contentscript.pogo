path = window.location.pathname

if (path.match r/issues|pull\/\d+/)
  style = "margin-left:10px;
    background:url('#(chrome.runtime.getURL('rainbow.gif'))') top left;color:white;"
  button = $('<a>', id: "plus_one_button", class: 'button minibutton', style: (style))

  number of votes = $('.comment-body p').filter
    $(this).text().match r/\+\d/
  .length || 1

  current user has already voted =
    current user = $('#user-links a.name').text().trim()
    r = @new RegExp(current user)

    $('a.comment-header-author:visible').filter
      r.test($(this).text())
    .length > 0

  disable button () =
    overlay style = "position:absolute;
      top:#(button.offset().top)px;left:#(button.offset().left)px;
      width:#(button.outer width())px;height:#(button.outer height())px;
      opacity:0.6;background-color:white;"

    overlay = $('<div>', id: "plus_one_button_overlay", style: (overlay style)).on 'click'
      false
    .append to 'body'

  button.text "+#(number of votes)".on 'click'
    $ 'textarea[name="comment[body]"]'.text '+1'
    $ 'button[type=submit]:contains("Comment"):last'.click()
    $ 'textarea[name="comment[body]"]'.text ''
    button.text "+#(number of votes + 1)"
    disable button()

  $ 'h2.discussion-topic-title'.append(button)

  if (current user has already voted)
    disable button()
