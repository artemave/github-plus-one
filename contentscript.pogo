path = window.location.pathname
button = $('<a>', class: 'button minibutton primary bigger', style: "margin-left:10px")

if (path.match r/issues|pull\/\d+/)
  number of votes = $('.comment-body p').filter
    $(this).text().match r/\+\d/
  .length || 1

  button.text "+#(number of votes)".on 'click'
    current user has not voted yet =
      current user = $('#user-links a.name').text().trim()
      r = @new RegExp(current user)

      $('a.comment-header-author:visible').filter
        r.test($(this).text())
      .length == 0

    if (current user has not voted yet)
      $ 'textarea[name="comment[body]"]'.text '+1'
      $ 'button[type=submit]:contains("Comment"):last'.click()
      $ 'textarea[name="comment[body]"]'.text ''

      button.text "+#(number of votes + 1)"
    else
      console.log 'already voted'

  $ 'h2.discussion-topic-title'.append(button)
