path = window.location.pathname

if (path.match r/issues|pull\/\d+/)
  style = "margin-left:10px;
    background:url('#(chrome.runtime.getURL('rainbow.gif'))') top left;color:white;
    font-weight:normal;text-shadow:none;"

  button = $('<a>', id: "plus_one_button", class: 'button minibutton', style: (style))

  number of votes = $('.comment-body p').filter
    zis = $(this)
    zis.text().match r/\+\d/ || zis.find('img.emoji[src$="+1.png"]').length
  .length

  current user has already voted =
    current user = $('#user-links a.name').text().trim()
    r = @new RegExp(current user)

    user comments = $('.comment[id|="issuecomment"]').filter
      r.test($(this).find('a.author').text())

    user comments.filter
      $(this).text().match r/\+\d/
    .length > 0

  disable button () =
    overlay style = "position:absolute;
      top:#(button.offset().top)px;left:#(button.offset().left)px;
      width:#(button.outer width())px;height:#(button.outer height())px;
      opacity:0.6;background-color:white;"

    overlay = $('<div>', id: "plus_one_button_overlay", style: (overlay style)).on 'click'
      false
    .append to 'body'

  button.text "+#(number of votes || 1)".on 'click'
    $ 'textarea[name="comment[body]"]'.text '+1'
    $ 'button[type=submit]:contains("Comment"):last'.click()
    $ 'textarea[name="comment[body]"]'.text ''
    button.text "+#(number of votes + 1)"
    disable button()

  $ '.gh-header-actions'.prepend(button)

  if (current user has already voted)
    disable button()
